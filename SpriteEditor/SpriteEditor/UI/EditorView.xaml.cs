using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;

namespace SpriteEditor.UI
{
    /// <summary>
    /// Interaction logic for EditorView.xaml
    /// </summary>
    public partial class EditorView : UserControl
    {
        #region Private members

        #endregion Private members

        #region Public properties
        
        internal EditorSettings EditorSettings { get; set; }

        #endregion Public properties

        #region Constructors

        public EditorView()
        {
            InitializeComponent();

            this.MouseLeftButtonUp += EditorView_MouseLeftButtonUp;
            this.MouseMove += EditorView_MouseMove;
        }

        #endregion Constructors

        #region Private methods

        void EditorView_MouseMove(object sender, MouseEventArgs e)
        {
            if ((e.LeftButton & MouseButtonState.Pressed) == 0 ||
                EditorSettings == null || EditorSettings.VideoMemory == null || EditorSettings.Color == null)
            {
                return;
            }
            var point = e.GetPosition(this);
            SetPixel(point);
            this.InvalidateVisual();
        }

        void EditorView_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            if (EditorSettings == null || EditorSettings.VideoMemory == null || EditorSettings.Color == null)
                return;

            var point = e.GetPosition(this);
            SetPixel(point);
            this.InvalidateVisual();
        }

        void SetPixel(Point point)
        {
            var dotW = EditorSettings.IsGridVisible ? EditorSettings.Scale + 1 : EditorSettings.Scale;
            int x = (int)point.X / dotW;
            int y = (int)point.Y / dotW;

            EditorSettings.VideoMemory.SetPixel(EditorSettings.Color.NativeColor, x, y);
        }

        protected override void OnRender(DrawingContext drawingContext)
        {
            //base.OnRender(drawingContext);

            drawingContext.DrawRectangle(new SolidColorBrush(Colors.LightGray), null, new Rect(0, 0, this.Width, this.Height));

            if (EditorSettings == null || EditorSettings.VideoMemory == null || EditorSettings.PaletteDictionary == null)
                return;

            int scale = EditorSettings.Scale;
            Rect rect = new Rect(0, 0, scale, scale);
            //if (m_scale > 1)
            //{
            //    rect.X = 1;
            //    rect.Y = 1;
            //}
            int offset = !EditorSettings.IsGridVisible ? scale : scale + 1;

            for (int x = 0; x < EditorSettings.VideoMemory.ScreenWidth; x++)
            {
                for (int y = 0; y < EditorSettings.VideoMemory.ScreenHeight; y++)
                {
                    var cidx = EditorSettings.VideoMemory.GetPixel(x, y);
                    if (!EditorSettings.PaletteDictionary.ContainsKey(cidx))
                        continue;

                    var color = EditorSettings.PaletteDictionary[cidx];
                    var brush = new SolidColorBrush(Color.FromArgb(color.A, color.R, color.G, color.B));

                    drawingContext.DrawRectangle(brush, null, rect);
                    rect.Offset(0, offset);
                }
                rect.Y = 0; // m_scale == 1 ? 0 : 1;
                rect.Offset(offset, 0);
            }
        }

        #endregion Private methods

        #region Public methods

        public void SetNewSize()
        {
            if (EditorSettings == null || EditorSettings.VideoMemory == null)
                return;

            int scale = EditorSettings.Scale;
            int w = 0, h = 0;
            if (!EditorSettings.IsGridVisible)
            {
                w = EditorSettings.VideoMemory.ScreenWidth * scale;
                h = EditorSettings.VideoMemory.ScreenHeight * scale;
            }
            else
            {
                w = EditorSettings.VideoMemory.ScreenWidth * (scale + 1) - 1;
                h = EditorSettings.VideoMemory.ScreenHeight * (scale + 1) - 1;
            }
            
            this.Width = w;
            this.Height = h;
        }

        #endregion Public methods
    }
}
