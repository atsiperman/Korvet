using SpriteEditor.Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;

namespace SpriteEditor.ViewModels
{
    class MainWindowViewModel : BaseViewModel
    {
        #region Private members 
       
        List<SeColor> m_colors;
        EditorSettings m_editorSettings;

        #endregion Private members

        #region Public properties

        public bool IsViewEnabled { get { return EditorSettings != null && EditorSettings.VideoMemory != null; } }

        public EditorSettings EditorSettings 
        { 
            get { return m_editorSettings; }
            private set
            {
                m_editorSettings = value;
                FireRenew();
            }
        }

        public int MaxScale { get { return 32; } }

        public int Scale { get { return EditorSettings.Scale; } }

        public string ScaleText { get { return string.Format("x{0}", EditorSettings.Scale); } }
         
        public bool ZoomInEnabled
        {
            get { return EditorSettings.VideoMemory != null && EditorSettings.Scale < MaxScale; }
        }

        public bool ZoomOutEnabled
        { 
            get { return EditorSettings.VideoMemory != null && EditorSettings.Scale > 1; }
        }

        public string Title
        {
            get
            {
                return string.Format("{0}{1}{2}", "Sprite Editor", string.IsNullOrEmpty(FilePath) ? string.Empty : " : ", FilePath);
            }
        }

        public string FilePath
        {
            get { return EditorSettings.FilePath; }
        }

        public List<SeColor> Colors
        {
            get { return m_colors; }
            set
            {
                m_colors = value;
                FirePropertyChanged("Colors");
            }
        }

        public SeColor SelectedColor
        {
            get { return EditorSettings.Color; }
            set
            {
                EditorSettings.Color = value;
                FirePropertyChanged("SelectedColor");
            }
        }

        #endregion Public properties

        #region Constructors

        public MainWindowViewModel()
        {
            EditorSettings = new EditorSettings();
        }

        #endregion Constructors

        #region Private methods

        private void OnScaleChanged()
        {
            FirePropertyChanged("ZoomInEnabled");
            FirePropertyChanged("ZoomOutEnabled");
            FirePropertyChanged("Scale");
            FirePropertyChanged("ScaleText");
        }

        private void FireRenew()
        {
            FirePropertyChanged("IsViewEnabled");
            FirePropertyChanged(nameof(Title));
        }

        #endregion Private methods

        #region Public methods

        public void New(EditorSettings settings)
        {
            NewHelper(settings.VideoMemory);
            EditorSettings.FilePath = settings.FilePath;
            FireRenew();
        }

        public void New(IVideoMemory videoMemory)
        {
            NewHelper(videoMemory);
            FireRenew();
        }

        private void NewHelper(IVideoMemory videoMemory)
        {
            EditorSettings.FilePath = string.Empty;
            EditorSettings.VideoMemory = videoMemory;
            EditorSettings.Scale = 1;
            EditorSettings.Palette = videoMemory.Palette;
            if (EditorSettings.Palette.Any())
                SelectedColor = EditorSettings.Palette.First();

            Colors = videoMemory.Palette;            

            OnScaleChanged();            
        }

        public void SetScale(int scale)
        {
            if (scale > 0 && scale <= MaxScale)
            {
                EditorSettings.Scale = scale;
                OnScaleChanged();
            }
        }

        public void ZoomIn()
        {
            if (EditorSettings.Scale < MaxScale)
            {
                EditorSettings.Scale++;
                OnScaleChanged();
            }
        }

        public void ZoomOut()
        {
            if (EditorSettings.Scale > 1)
            {
                EditorSettings.Scale--;
                OnScaleChanged();
            }
        }

        public void SaveToFile(string file)
        {
            FileSaver.Save(EditorSettings, file, SelectedColor.NativeColor);
            FirePropertyChanged(nameof(Title));
        }

        public EditorSettings LoadFromFile(string file)
        {
            return FileSaver.Read(file);
        }

        public void MirrorVertically()
        {
            var vm = EditorSettings.VideoMemory;
            for (var y = 0; y < vm.ScreenHeight; y++)
            {
                for (var x = 0; x < vm.ScreenWidth / 2; x++)
                {
                    var rightIndex = vm.ScreenWidth - 1 - x;
                    var a = vm.GetPixel(x, y);
                    var b = vm.GetPixel(rightIndex, y);
                    vm.SetPixel(b, x, y);
                    vm.SetPixel(a, rightIndex, y);
                }
            }
        }

        #endregion Public methods
    }
}
