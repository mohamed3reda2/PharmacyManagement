using System;
using System.Collections.Generic;
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

namespace PharmacyManagement
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void login_Click(object sender, RoutedEventArgs e)
        {
            string username =usernamet.Text;
            string password = passwordt.Password;
            PharmacyEntities pharmacyEntities = new PharmacyEntities();
            var adminUser = pharmacyEntities.Admin_users
            .FirstOrDefault(a => a.Admin_name == username && a.Admin_pass == password);
            if (adminUser != null)
            {
              
               POS pos = new POS();
                pos.Show();
                this.Close();
             
            }
            else
            {
                
                MessageBox.Show("Invalid username or password. Please try again.");
            }
            usernamet.Text = passwordt.Password = "";
        }
    }
}
