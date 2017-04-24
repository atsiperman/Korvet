using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SpriteEditor.Editor
{
    interface IEditAction
    {
        void Redo(IVideoMemory videoMemory);
        void Undo(IVideoMemory videoMemory);
    }
}
