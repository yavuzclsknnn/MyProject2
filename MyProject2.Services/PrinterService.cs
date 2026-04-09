using System;
using System.Collections.Generic;
using System.Text;
using static MyProject2.Models.DirectPrint;

namespace MyProject2.Services
{
    public class PrinterService
    {
        public void PrintLabel(string ProductName, double weight, string barcode)
        {

            string zpl = "$@sadasda";

            RawPrinterHelper.SendStringToPrinter("Zebra ZD2020", zpl);

        }
    }
}
