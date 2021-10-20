namespace SpriteEditor.Editor
{
    class FillAllAction : IEditAction
    {
        #region Private members

        uint m_nativeColorNew;
        IVideoMemory m_copyOfOldMemory;

        #endregion Private members

        #region Constructors

        public FillAllAction(IVideoMemory copyOfOldMemory, uint nativeColorNew)
        {
            m_copyOfOldMemory = copyOfOldMemory;
            m_nativeColorNew = nativeColorNew;
        }

        #endregion Constructors

        #region Private methods
        #endregion Private methods

        #region Public methods

        public void Redo(IVideoMemory videoMemory)
        {
            videoMemory.Fill(m_nativeColorNew);
        }

        public void Undo(IVideoMemory videoMemory)
        {
            videoMemory.CopyFrom(m_copyOfOldMemory);
        }

        #endregion Public methods
    }
}
