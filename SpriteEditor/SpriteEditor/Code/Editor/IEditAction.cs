namespace SpriteEditor.Editor
{
    interface IEditAction
    {
        void Redo(IVideoMemory videoMemory);
        void Undo(IVideoMemory videoMemory);
    }
}
