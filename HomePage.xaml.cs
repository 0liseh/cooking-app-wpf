﻿using System;
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

namespace cooking_app
{
    /// <summary>
    /// Interaction logic for HomePage.xaml
    /// </summary>
    public partial class HomePage : Page
    {
        public HomePage()
        {
            InitializeComponent();
           // Switcher.pageSwitcher = this;
           // Switcher.Switch(new HomePage)
        }

      //  public void Navigate(UserControl nextPage)
      //  {
      //      this.Content = newPage
      //  }

//        private void btnProfile_Click(object sender, RoutedEventArgs e)
//        {
//               this.NavigationService.Navigate(new Uri("Profile.xaml", UriKind.Relative));
//        }

        //private void btnHome_Click(object sender, RoutedEventArgs e)
       // {
        //    Switcher.Switch(new HomePage())
        //}

        //private void btnSavedRecipes_Click(object sender, RoutedEventArgs e)
        //{
        //       Switcher.Switch(new SavedRecipesPage());
       // }
    }
}
