using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace MyProject2.Admin.Views
{
    public partial class UCAnaSayfaFrm : UserControl
    {


        public int ToplamUrun { get; set; } = 7547702;
        public int ToplamKullanici { get; set; } = 3563583;
        public int ToplamKategori { get; set; } = 422062;



        private readonly Dictionary<Canvas, DispatcherTimer> animationTimers = new();
        private readonly Dictionary<Canvas, double> animationProgresses = new();
        private const double animationStep = 0.02;


        public UCAnaSayfaFrm()
        {
            InitializeComponent();
            DataContext = this;
        }


        private void CanvasPie_Loaded(object sender, RoutedEventArgs e)
        {


            //if (sender is Canvas canvas)
            //{
            //    DrawPieForCanvas(canvas);
            //}

            if (sender is Canvas canvas)
            {
                StartAnimation(canvas);
            }
        }


        #region Start Animation

        private void CanvasPie_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            if (sender is Canvas canvas && canvas.ActualWidth > 0 && canvas.ActualHeight > 0)
            {
                StartAnimation(canvas);
            }
        }

        private void StartAnimation(Canvas canvas)
        {
            animationProgresses[canvas] = 0;

            if (animationTimers.ContainsKey(canvas))
            {
                animationTimers[canvas].Stop();
                animationTimers[canvas].Tick -= (s, e) => AnimatePie(canvas);
            }

            var timer = new DispatcherTimer
            {
                Interval = TimeSpan.FromMilliseconds(20)
            };

            timer.Tick += (s, e) => AnimatePie(canvas);
            animationTimers[canvas] = timer;

            timer.Start();
        }



        private void AnimatePie(Canvas canvas)
        {
            if (!animationProgresses.TryGetValue(canvas, out double progress))
                progress = 0;

            progress += animationStep;

            if (progress >= 1)
            {
                progress = 1;
                if (animationTimers.ContainsKey(canvas))
                    animationTimers[canvas].Stop();
            }

            animationProgresses[canvas] = progress;

            (string label, double percent, Brush color)[] data;

            if (canvas == CanvasPie1)
                data = new (string, double, Brush)[]
                {
                    ("Ürünler", 25.0, Brushes.Blue),
                    ("Kategori", 25.0, Brushes.Red),
                    ("Sayfalama", 25.0, Brushes.Gold),
                    ("Satış", 25.0, Brushes.Gray)
                };
            else if (canvas == CanvasPie2)
                data = new (string, double, Brush)[]
                {
                    ("A", 40.0, Brushes.Green),
                    ("B", 20.0, Brushes.Orange),
                    ("C", 25.0, Brushes.Purple),
                    ("D", 15.0, Brushes.CadetBlue)
                };
            else if (canvas == CanvasPie3)
                data = new (string, double, Brush)[]
                {
                    ("X", 30.0, Brushes.DeepSkyBlue),
                    ("Y", 30.0, Brushes.HotPink),
                    ("Z", 20.0, Brushes.Yellow),
                    ("W", 20.0, Brushes.Gray)
                };
            else
                data = new (string, double, Brush)[]
                {
                    ("Kutu", 50.0, Brushes.LimeGreen),
                    ("Paket", 20.0, Brushes.Red),
                    ("Adet", 15.0, Brushes.Gold),
                    ("Kilo", 15.0, Brushes.DarkGray)
                };

            DrawPieAnimation(canvas, data, progress);
        }




        private void DrawPieAnimation(Canvas canvas, (string label, double percent, Brush color)[] slices, double progress)
        {
            canvas.Children.Clear();

            double radius = Math.Min(canvas.ActualWidth, canvas.ActualHeight) / 2 - 10;
            if (radius <= 0) return;

            Point center = new Point(canvas.ActualWidth / 2, canvas.ActualHeight / 2);
            double startAngle = 0;

            double totalPercentDrawn = 0;

            foreach (var slice in slices)
            {
                double slicePercentProgress = Math.Min(slice.percent / 100, progress - totalPercentDrawn);
                if (slicePercentProgress <= 0)
                    break;

                double sweep = slicePercentProgress * 360;
                double endAngle = startAngle + sweep;

                PathFigure fig = new PathFigure { StartPoint = center };
                double startRad = startAngle * Math.PI / 180;
                double endRad = endAngle * Math.PI / 180;

                Point p1 = new Point(center.X + radius * Math.Cos(startRad),
                                     center.Y + radius * Math.Sin(startRad));
                Point p2 = new Point(center.X + radius * Math.Cos(endRad),
                                     center.Y + radius * Math.Sin(endRad));

                fig.Segments.Add(new LineSegment(p1, true));
                fig.Segments.Add(new ArcSegment(p2, new Size(radius, radius), 0, sweep > 180, SweepDirection.Clockwise, true));
                fig.Segments.Add(new LineSegment(center, true));

                PathGeometry geo = new PathGeometry();
                geo.Figures.Add(fig);

                Path path = new Path { Fill = slice.color, Data = geo };
                canvas.Children.Add(path);

                double midAngle = (startAngle + endAngle) / 2;
                double midRad = midAngle * Math.PI / 180;
                double labelRadius = radius * 0.6;

                Point labelPoint = new Point(center.X + labelRadius * Math.Cos(midRad),
                                             center.Y + labelRadius * Math.Sin(midRad));

                double displayedPercent = Math.Round(slicePercentProgress * 100, 1);

                TextBlock txt = new TextBlock
                {
                    Text = $"{slice.label} {displayedPercent}%",
                    FontWeight = FontWeights.Bold,
                    FontSize = Math.Max(10, Math.Min(radius * 0.1, 16)),
                    Foreground = IsDarkColor(slice.color) ? Brushes.White : Brushes.Black,
                };
                txt.Measure(new Size(double.PositiveInfinity, double.PositiveInfinity));
                Size textSize = txt.DesiredSize;

                Canvas.SetLeft(txt, labelPoint.X - textSize.Width / 2);
                Canvas.SetTop(txt, labelPoint.Y - textSize.Height / 2);
                canvas.Children.Add(txt);

                startAngle = endAngle;
                totalPercentDrawn += slicePercentProgress;
                if (totalPercentDrawn >= progress)
                    break;
            }
        }

        private bool IsDarkColor(Brush brush)
        {
            if (brush is SolidColorBrush scb)
            {
                var color = scb.Color;
                double brightness = (color.R * 0.299) + (color.G * 0.587) + (color.B * 0.114);
                return brightness < 128;
            }
            return false;
        }

        #endregion





        #region DrawPie

        private void DrawPie(Canvas canvas, (string label, double percent, Brush color)[] slices)
        {
            canvas.Children.Clear();

            double radius = Math.Min(canvas.ActualWidth, canvas.ActualHeight) / 2 - 4;
            if (radius <= 0) return;

            Point center = new Point(canvas.ActualWidth / 2, canvas.ActualHeight / 2);
            double startAngle = 0;

            foreach (var slice in slices)
            {
                double sweep = slice.percent / 100 * 360;
                double endAngle = startAngle + sweep;

                PathFigure fig = new PathFigure { StartPoint = center };
                double startRad = startAngle * System.Math.PI / 180;
                double endRad = endAngle * System.Math.PI / 180;

                Point p1 = new Point(center.X + radius * System.Math.Cos(startRad),
                                     center.Y + radius * System.Math.Sin(startRad));
                Point p2 = new Point(center.X + radius * System.Math.Cos(endRad),
                                     center.Y + radius * System.Math.Sin(endRad));

                fig.Segments.Add(new LineSegment(p1, true));
                fig.Segments.Add(new ArcSegment(p2, new Size(radius, radius), 0, sweep > 180, SweepDirection.Clockwise, true));
                fig.Segments.Add(new LineSegment(center, true));

                PathGeometry geo = new PathGeometry();
                geo.Figures.Add(fig);

                Path path = new Path { Fill = slice.color, Data = geo };
                canvas.Children.Add(path);

                // Etiket
                double midAngle = (startAngle + endAngle) / 2;
                double midRad = midAngle * System.Math.PI / 180;
                double labelRadius = radius * 0.6;
                Point labelPoint = new Point(center.X + labelRadius * System.Math.Cos(midRad),
                                             center.Y + labelRadius * System.Math.Sin(midRad));

                double fontSize = radius * 0.12;

                TextBlock txt = new TextBlock
                {
                    Text = $"{slice.label} {slice.percent}%",
                    Foreground = Brushes.White,
                    FontWeight = FontWeights.Bold,
                    FontSize = fontSize
                };
                Canvas.SetLeft(txt, labelPoint.X - 20);
                Canvas.SetTop(txt, labelPoint.Y - 10);
                canvas.Children.Add(txt);

                startAngle = endAngle;
            }


        }

        #endregion




        #region DrawPie2

        private void DrawPie2(Canvas canvas, (string label, double percent, Brush color)[] slices)
        {
            canvas.Children.Clear();

            double radius = Math.Min(canvas.ActualWidth, canvas.ActualHeight) / 2 - 10;
            if (radius <= 0) return;

            Point center = new Point(canvas.ActualWidth / 2, canvas.ActualHeight / 2);
            double startAngle = 0;

            foreach (var slice in slices)
            {
                double sweep = slice.percent / 100 * 360;
                double endAngle = startAngle + sweep;

                // --- PIE SHAPE ---
                PathFigure fig = new PathFigure { StartPoint = center };

                double startRad = startAngle * Math.PI / 180;
                double endRad = endAngle * Math.PI / 180;

                Point p1 = new Point(center.X + radius * Math.Cos(startRad),
                                     center.Y + radius * Math.Sin(startRad));

                Point p2 = new Point(center.X + radius * Math.Cos(endRad),
                                     center.Y + radius * Math.Sin(endRad));

                fig.Segments.Add(new LineSegment(p1, true));
                fig.Segments.Add(new ArcSegment(p2, new Size(radius, radius), 0,
                                                sweep > 180,
                                                SweepDirection.Clockwise, true));
                fig.Segments.Add(new LineSegment(center, true));

                PathGeometry geo = new PathGeometry();
                geo.Figures.Add(fig);

                Path path = new Path
                {
                    Fill = slice.color,
                    Data = geo,
                    ToolTip = $"{slice.label} : {slice.percent}%" // 🔥 TOOLTIP
                };

                canvas.Children.Add(path);

                // --- LABEL POSITION ---
                double midAngle = (startAngle + endAngle) / 2;
                double midRad = midAngle * Math.PI / 180;

                bool isSmallSlice = slice.percent < 12; // 🔥 küçük dilim kontrolü

                double labelRadius = isSmallSlice ? radius * 1.2 : radius * 0.6;

                Point labelPoint = new Point(
                    center.X + labelRadius * Math.Cos(midRad),
                    center.Y + labelRadius * Math.Sin(midRad)
                );

                double fontSize = radius * 0.10;

                TextBlock txt = new TextBlock
                {
                    Text = $"{slice.label} {slice.percent}%",
                    Foreground = isSmallSlice ? Brushes.Black : Brushes.White,
                    FontWeight = FontWeights.Bold,
                    FontSize = fontSize
                };

                txt.Measure(new Size(double.PositiveInfinity, double.PositiveInfinity));

                Canvas.SetLeft(txt, labelPoint.X - txt.DesiredSize.Width / 2);
                Canvas.SetTop(txt, labelPoint.Y - txt.DesiredSize.Height / 2);

                canvas.Children.Add(txt);

                // --- LEADER LINE (küçük dilimler için çizgi) ---
                if (isSmallSlice)
                {
                    Point edgePoint = new Point(
                        center.X + radius * Math.Cos(midRad),
                        center.Y + radius * Math.Sin(midRad)
                    );

                    Line line = new Line
                    {
                        X1 = edgePoint.X,
                        Y1 = edgePoint.Y,
                        X2 = labelPoint.X,
                        Y2 = labelPoint.Y,
                        Stroke = Brushes.Gray,
                        StrokeThickness = 1
                    };

                    canvas.Children.Add(line);
                }

                startAngle = endAngle;
            }
        }




        #endregion




    }
}
