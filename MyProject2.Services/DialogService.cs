using System;
using System.Collections.Generic;
using System.Text;

namespace MyProject2.Services
{
    public static class DialogService
    {


        /// <summary>
        /// Dinamik bir öğeyi kullanıcıya sorarak siler ve koleksiyondan çıkarır
        /// </summary>
        /// <typeparam name="T">Koleksiyon tipi (ör. Urun)</typeparam>
        /// <param name="selectedItem">Seçili öğe</param>
        /// <param name="collection">ObservableCollection içinden silinecek koleksiyon</param>
        /// <param name="deleteAction">DB veya repository üzerinde silme işlemi</param>
        /// <param name="itemName">Silinecek öğenin ekranda gösterilecek adı</param>
        /// <returns>Silme başarılı mı?</returns>
        //public static bool ConfirmAndDelete<T>(T? selectedItem, ObservableCollection<T> collection, Action<T> deleteAction, Func<T, string> itemName)
        //{


        //    if (selectedItem == null)
        //    {

        //        //CustomMessageBox2.Show("Lütfen silmek için bir öğe seçin.",
        //        //                        MessageBoxButton.OK,
        //        //                        MessageType.Warning);


        //        return false;

        //    }

        //    var name = itemName(selectedItem);
        //    // 3️⃣ Silme onayı sor
        //    //bool confirm = CustomMessageBox2.Show($"\"{name}\" adlı öğeyi silmek istediğinize emin misiniz?",
        //    //                                        MessageBoxButton.YesNo,
        //    //                                        MessageType.Warning);

        //    //if (!confirm) return false;

        //    //try
        //    //{
        //    //    // Repository veya DB silme
        //    //    deleteAction(selectedItem);

        //    //    // ObservableCollection’dan çıkar
        //    //    collection.Remove(selectedItem);

        //    //    return true;
        //    //}
        //    //catch (Exception ex)
        //    //{

        //    //    //  Hata mesajı
        //    //    CustomMessageBox2.Show("Silme hatası: " + ex.Message,
        //    //                            MessageBoxButton.OK,
        //    //                            MessageType.Error);


        //    //    return false;
        //    //}


        //}



    }
}
