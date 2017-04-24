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

        #endregion Private members

        #region Public properties

        public EditorSettings EditorSettings { get; private set; }

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

        #endregion Private methods

        #region Public methods

        public void New(IVideoMemory videoMemory)
        {
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
            FileSaver.Save(EditorSettings, file);
        }

        public EditorSettings LoadFromFile(string file)
        {
            return FileSaver.Read(file);
        }

        #endregion Public methods
    }
}
