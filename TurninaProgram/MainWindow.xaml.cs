using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace TurninaProgram
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            DataBase.Context = new ToursEntities();

            MainFrame.Navigate(new ToursPage());
        }

        public void firstUploadOfPhotos()
        {
            string path = "C:\\Users\\KIT_07_206\\Desktop\\турнина\\import\\Туры фото";
            List<string> Files = Directory.GetFiles(path).ToList();

            foreach (string FilePath in Files)
            {
                using (FileStream stream = File.OpenRead(FilePath))
                {
                    byte[] FileBytes = new byte[stream.Length];
                    stream.Read(FileBytes, 0 ,FileBytes.Length);

                    string FileName = System.IO.Path.GetFileNameWithoutExtension(FilePath);
                    Tour RedactingTour = DataBase.Context.Tour.Where(finding => finding.Name == FileName).FirstOrDefault();
                    RedactingTour.ImagePreview = FileBytes;
                    DataBase.Context.SaveChanges();
                }
            }

            MessageBox.Show("Check database");
        }
    }
}
