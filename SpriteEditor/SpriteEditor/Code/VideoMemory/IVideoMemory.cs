using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace SpriteEditor
{
    public interface IVideoMemory
    {
        #region Properties

        /// <summary>
        /// Gets description of the implemented video memory engine.
        /// </summary>
        string Description { get; }

        /// <summary>
        /// Gets with of the screen / sprite. 
        /// </summary>
        int ScreenWidth { get; }

        /// <summary>
        /// Gets height of the screen / sprite.
        /// </summary>
        int ScreenHeight { get; }

        /// <summary>
        /// Gets a color palette.
        /// </summary>
        List<SeColor> Palette { get; }

        #endregion Properties

        #region Methods

        /// <summary>
        /// Gets native color of the specified pixel.
        /// </summary>
        /// <param name="x"></param>
        /// <param name="y"></param>
        /// <returns></returns>
        uint GetPixel(int x, int y);

        /// <summary>
        /// Sets pixel by the given native color. 
        /// </summary>
        /// <param name="nativeColor">native color of the current video memory</param>
        /// <param name="x"></param>
        /// <param name="y"></param>
        void SetPixel(uint nativeColor, int x, int y);

        /// <summary>
        /// Fills all the memory by the given color.
        /// </summary>
        /// <param name="nativeColor"></param>
        void Fill(uint nativeColor);

        /// <summary>
        /// Sets size of the screen / sprite.
        /// </summary>
        /// <param name="width"></param>
        /// <param name="height"></param>
        void SetScreenSize(int width, int height);

        /// <summary>
        /// Makes a copy of the current instance.
        /// </summary>
        /// <returns></returns>
        IVideoMemory Clone();

        /// <summary>
        /// Copies contents of the given instance.
        /// </summary>
        /// <param name="clone"></param>
        void CopyFrom(IVideoMemory clone);

        #endregion Methods
    }
}
