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
using System.Windows.Shapes;

namespace SpriteEditor.UI
{
    /// <summary>
    /// Interaction logic for NewImageDialog.xaml
    /// </summary>
    public partial class NewImageDialog : Window
    {
        #region Public properties 

        public int ScreenWidth
        {
            get
            {
                int n = 0;
                int.TryParse(m_textWidth.Text, out n);
                return n;
            }

            set
            {
                m_textWidth.Text = "" + value;
                m_textWidth.SelectAll();
                m_textWidth.Focus();
            }
        }

        public int ScreenHight
        {
            get
            {
                int n = 0;
                int.TryParse(m_textHeight.Text, out n);
                return n;
            }

            set
            {
                m_textHeight.Text = "" + value;
                m_textHeight.SelectAll();
                m_textHeight.Focus();
            }
        }

        #endregion Public properties
        
        public NewImageDialog()
        {
            InitializeComponent();

            ScreenHight = 32;
            ScreenWidth = 32;

            m_btnOK.Click += OK_Click;
            m_btnCancel.Click += Cancel_Click;
        }

        void OK_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = true;
            this.Close();            
        }

        void Cancel_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
            this.Close();
        }
    }
}
