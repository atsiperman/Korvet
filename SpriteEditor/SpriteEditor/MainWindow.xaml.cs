﻿using Microsoft.Win32;
using SpriteEditor.UI;
using SpriteEditor.ViewModels;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace SpriteEditor
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        MainWindowViewModel m_viewModel;

        public MainWindow()
        {
            InitializeComponent();
            this.DataContext = m_viewModel = new MainWindowViewModel();

            m_editorView.EditorSettings = m_viewModel.EditorSettings;
            m_colorPanel.SelectionChanged += ColorPanel_SelectionChanged;
            m_btnFill.Click += Fill_Click;
            m_scaleSlider.ValueChanged += ScaleSlider_ValueChanged;
            m_btnMirrorVertically.Click += MirrorVertically;
            //Init();
        }

        private void MirrorVertically(object sender, RoutedEventArgs e)
        {
            m_viewModel.MirrorVertically();
            FireRedraw();
        }

        private void ScaleSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            SetScale((int)e.NewValue);
        }

        void Fill_Click(object sender, RoutedEventArgs e)
        {
            if (m_viewModel.EditorSettings.VideoMemory == null || m_viewModel.EditorSettings.Color == null)
                return;

            m_viewModel.EditorSettings.VideoMemory.Fill(m_viewModel.EditorSettings.Color.NativeColor);
            m_editorView.InvalidateVisual();
        }

        void ColorPanel_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (m_colorPanel.SelectedItem == null)
            {
                if (m_viewModel.EditorSettings.Palette.Any())
                    m_viewModel.SelectedColor = m_viewModel.EditorSettings.Palette[0];
            }
            else
            {
                m_viewModel.SelectedColor = (SeColor)m_colorPanel.SelectedItem;
            }
        }

        private void Init()
        {
            var dlg = new NewImageDialog();
            if (dlg.ShowDialog() != true)
                return;
            
            var vm = new KorvetVideoMemory();
            vm.SetScreenSize(dlg.ScreenWidth, dlg.ScreenHight);
            m_viewModel.New(vm);
            m_editorView.SetNewSize();
        }

        private void FireRedraw()
        {
            m_editorView.InvalidateVisual();
        }

        private void ZoomIn_Click(object sender, RoutedEventArgs e)
        {
            ZoomIn();
        }

        private void ZoomOut_Click(object sender, RoutedEventArgs e)
        {
            ZoomOut();
        }

        private void SetScale(int scale)
        {
            int oldScale = m_viewModel.Scale;
            m_viewModel.SetScale(scale);
            if (oldScale != m_viewModel.Scale)
            {
                m_editorView.SetNewSize();
            }
        }

        private void ZoomIn()
        {
            int oldScale = m_viewModel.Scale;
            m_viewModel.ZoomIn();
            if (oldScale != m_viewModel.Scale)
            {
                m_editorView.SetNewSize();
            }
        }

        private void ZoomOut()
        {
            int oldScale = m_viewModel.Scale;
            m_viewModel.ZoomOut();
            if (oldScale != m_viewModel.Scale)
            {
                m_editorView.SetNewSize();
            }
        }

        private void MenuItem_New(object sender, RoutedEventArgs e)
        {
            Init();
        }

        const string FileFilter = "Sprites (*.spr)|*.spr|Sprite data (*.dat)|*.dat";

        private void MenuItem_Open(object sender, RoutedEventArgs e)
        {
            var d = new OpenFileDialog();
            d.Filter = FileFilter;
            d.FilterIndex = 0;
            var ret = d.ShowDialog(this);
            if (!(ret.HasValue && ret.Value))
            {
                return;
            }
            var newModel = m_viewModel.LoadFromFile(d.FileName);
            m_viewModel.New(newModel);
            FireRedraw();
        }

        private void MenuItem_Save(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(m_viewModel.FilePath))
            {
                MenuItem_SaveAs(sender, e);
            }
            else
            {
                m_viewModel.SaveToFile(m_viewModel.FilePath);
            }
        }

        private void MenuItem_SaveAs(object sender, RoutedEventArgs e)
        {
            var d = new SaveFileDialog();            
            d.Filter = FileFilter;
            d.FilterIndex = 0;
            d.OverwritePrompt = true;
            d.FileName = Path.GetFileName(m_viewModel.FilePath);
            var ret = d.ShowDialog(this);
            if (!(ret.HasValue && ret.Value))
            {
                return;
            }
            m_viewModel.SaveToFile(d.FileName);
        }

        private void MenuItem_Exit(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void ImageType_Checked(object sender, RoutedEventArgs e)
        {
            m_viewModel.SetImageType((string)(e.Source as RadioButton).Tag);
        }
    }
}
