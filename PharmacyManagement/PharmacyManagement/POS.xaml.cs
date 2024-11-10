using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace PharmacyManagement
{
    public partial class POS : Window
    {
        private PharmacyEntities PharmacyEntities = new PharmacyEntities();
        private int label = 0;
        private int item_Id = 0;
        private int Qty1 = 0;
        private string name;
        private int userId;
        private decimal price1 = 0;
        private int item_Idedit = 0;
        private string nameedit;
        private int stockedit;
        private DateTime date;
        User selectedUser =new User();
        private decimal priceedit = 0;

        public POS()
        {
            
            
                InitializeComponent();
                labelview.Content = $"Qty = {label}";
                LoadData();
            LoadCustomersForComboBox();


        }

        public void LoadData()
        {
           
                var products = PharmacyEntities.Products.ToList();
                dataview.ItemsSource = products;
                edit.ItemsSource = products;

        }

        private void dataview_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
         
                if (dataview.SelectedItem is Product selectedProduct)
                {
                    item_Id = selectedProduct.Product_id;
                    Qty1 = selectedProduct.stock_Number;
                    price1 = selectedProduct.price;
                }

        }

        private void plus_Copy_Click(object sender, RoutedEventArgs e)
        {
            
                label++;
                labelview.Content = $"Qty = {label}";
        }

        private void m_Click(object sender, RoutedEventArgs e)
        {
   
                if (label > 0)
                {
                    label--;
                    labelview.Content = $"Qty = {label}";
                }
 
        }
        private void login_Click(object sender, RoutedEventArgs e)
        {
            User user = new User();
            user.user_name = usernamet.Text;
            user.Pathological_condition = Pathological_condition.Text;
            if (radio.IsChecked == true)
            {
                user.Loyalty_Card = true;
            }

            else
            {
                user.Loyalty_Card = false;
            }
            PharmacyEntities.Users.Add(user);
            PharmacyEntities.SaveChanges();
            LoadCustomersForComboBox();
            usernamet.Text = Pathological_condition.Text = "";
            radio.IsChecked = false;
        }
        private void buy_Click(object sender, RoutedEventArgs e)
        {
            if (cmbCustomerName.SelectedItem is User selectedCustomer)
            {
                selectedUser.User_id = selectedCustomer.User_id;

                if (item_Id > 0 && label > 0)
                {
                    var product = PharmacyEntities.Products.FirstOrDefault(p => p.Product_id == item_Id);

                    if (product != null && label <= product.stock_Number) 
                    {
                        decimal finalPrice = price1;

                       
                        if (selectedCustomer.Loyalty_Card.HasValue && selectedCustomer.Loyalty_Card.Value)
                        {
                            finalPrice *= 0.8m; 
                        }

                        product.stock_Number -= label;
                        PharmacyEntities.SaveChanges();

                        string sql = "INSERT INTO sales (Product_id, User_id, Qty, price) VALUES (@productId, @userId, @qty, @price)";
                        PharmacyEntities.Database.ExecuteSqlCommand(sql,
                            new SqlParameter("@productId", item_Id),
                            new SqlParameter("@userId", selectedUser.User_id),
                            new SqlParameter("@qty", label),
                            new SqlParameter("@price", finalPrice));

                        MessageBox.Show("تمت عملية الشراء بنجاح!", "نجاح", MessageBoxButton.OK, MessageBoxImage.Information);

                        label = 0;
                        labelview.Content = $"Qty = {label}";
                        LoadData();
                    }
                    else
                    {
                        MessageBox.Show("الكمية المطلوبة تتجاوز المخزون المتاح.", "خطأ", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
                else
                {
                    MessageBox.Show("يرجى اختيار منتج وتحديد كمية.", "خطأ", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                MessageBox.Show("يرجى اختيار عميل قبل إتمام الشراء.", "خطأ", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }



        private void LoadCustomersForComboBox()
        {
            cmbCustomerName.ItemsSource = PharmacyEntities.Users.ToList();
            cmbCustomerName.DisplayMemberPath = "user_name";
            cmbCustomerName.SelectedValuePath = "User_id";
        }

        private void edit_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
           
                if (edit.SelectedItem is Product selectedProduct)
                {
                    item_Idedit = selectedProduct.Product_id;
                    editname.Text = selectedProduct.Product_name;
                    editstock.Text =selectedProduct.stock_Number.ToString();
                    editprice.Text = selectedProduct.price.ToString();
                    type.Text=selectedProduct.Product_type.ToString();
                    editdate.SelectedDate = selectedProduct.Expiration_date;
                    

                }
            
        }

        private void add_Click(object sender, RoutedEventArgs e)
        {
            decimal p = Convert.ToDecimal(editprice.Text);
            Product product = new Product();
            expens expens = new expens();
            product.Product_name = editname.Text;
            product.stock_Number = Convert.ToInt32(editstock.Text);
            product.price = p;
            product.Expiration_date = Convert.ToDateTime(editdate.SelectedDate);
            product.Product_type = type.Text;
            PharmacyEntities.Products.Add(product);
            PharmacyEntities.SaveChanges();
            string query = "INSERT INTO expenses (Product_id, Qty, price) VALUES (@ProductId, @Qty, @Price)";
            PharmacyEntities.Database.ExecuteSqlCommand(query,
                new SqlParameter("@ProductId", product.Product_id),
                new SqlParameter("@Qty", product.stock_Number),
                new SqlParameter("@Price", p *= 0.6m));

            LoadData();
            editname.Text = editstock.Text = editprice.Text = "";
        }
   




        private void update_Click(object sender, RoutedEventArgs e)
        {

            var productToUpdate = PharmacyEntities.Products.FirstOrDefault(p => p.Product_id == item_Idedit);

            if (productToUpdate != null)
            {
                productToUpdate.Product_name = editname.Text;
                
                productToUpdate.price = Convert.ToDecimal(editprice.Text);
                productToUpdate.Expiration_date = Convert.ToDateTime(editdate.SelectedDate);
                productToUpdate.Product_type= type.Text;
                if (int.Parse(editstock.Text) > productToUpdate.stock_Number) {
                    decimal p = Convert.ToDecimal(editprice.Text);
                    string query = "INSERT INTO expenses (Product_id, Qty, price) VALUES (@ProductId, @Qty, @Price)";
                    PharmacyEntities.Database.ExecuteSqlCommand(query,
                        new SqlParameter("@ProductId", productToUpdate.Product_id),
                        new SqlParameter("@Qty", Convert.ToInt32(editstock.Text)),
                        new SqlParameter("@Price", p *= 0.6m));
                }
                productToUpdate.stock_Number = Convert.ToInt32(editstock.Text);
                PharmacyEntities.SaveChanges();
                LoadData();
                editname.Text = editstock.Text = editprice.Text = "";
                editdate.SelectedDate = null;
            }
        }

        private void sal_Click(object sender, RoutedEventArgs e)
        {
         
            
                var sales = PharmacyEntities.sales.ToList();
                viewinfo.ItemsSource = sales;
      
        }

        private void ex_Click(object sender, RoutedEventArgs e)
        {
          
                var expenses = PharmacyEntities.expenses.ToList();
                viewinfo.ItemsSource = expenses;
            

        }

        private void rep_Click(object sender, RoutedEventArgs e)
        {
   
                var reports = PharmacyEntities.reports.ToList();
                viewinfo.ItemsSource = reports;
   
        }

        private void newrep_Click(object sender, RoutedEventArgs e)
        {
         
              
                decimal total_sales = 0;
                decimal total_expenses = 0;
                string salesQuery = "SELECT SUM(Total_Price) FROM sales WHERE sales_date BETWEEN '2024-01-01' AND '2024-12-31'";
                total_sales = (decimal)PharmacyEntities.Database.SqlQuery<decimal>(salesQuery).FirstOrDefault();
                string expensesQuery = "SELECT SUM(Total_Price) FROM expenses WHERE expenses_date BETWEEN '2024-01-01' AND '2024-12-31'";
                total_expenses = (decimal)PharmacyEntities.Database.SqlQuery<decimal>(expensesQuery).FirstOrDefault();
                decimal difference = total_sales - total_expenses;
                string insertQuery = "INSERT INTO reports (Total_Price_e, Total_Price_s, report_Content) VALUES (@total_expenses, @total_sales, @report_content)";
                PharmacyEntities.Database.ExecuteSqlCommand(insertQuery,
                    new SqlParameter("@total_expenses", total_expenses),
                    new SqlParameter("@total_sales", total_sales),
                    new SqlParameter("@report_content", $"{difference} = المكاسب"));

                MessageBox.Show("تم إنشاء التقرير بنجاح!", "نجاح", MessageBoxButton.OK, MessageBoxImage.Information);
            
        }

        private void cmbCustomerName_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
