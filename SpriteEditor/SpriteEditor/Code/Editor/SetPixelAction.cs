namespace SpriteEditor.Editor
{
    class SetPixelAction : IEditAction
    {
        #region Private members

        uint m_nativeColorOld;
        uint m_nativeColorNew;
        int m_x;
        int m_y;

        #endregion Private members

        #region Constructors

        public SetPixelAction(uint nativeColorOld, uint nativeColorNew, int x, int y)
        {
            m_nativeColorOld = nativeColorOld;
            m_nativeColorNew = nativeColorNew;
            m_x = x;
            m_y = y;
        }

        #endregion Constructors

        #region Public methods

        public void Redo(IVideoMemory videoMemory)
        {
            videoMemory.SetPixel(m_nativeColorNew, m_x, m_y);
        }

        public void Undo(IVideoMemory videoMemory)
        {
            videoMemory.SetPixel(m_nativeColorOld, m_x, m_y);
        }

        #endregion Public methods
    }
}
