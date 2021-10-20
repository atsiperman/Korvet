using System.IO;

namespace SpriteEditor.Code.Storage
{
    static class ExportMask
    {
        public static void Save(string path, IVideoMemory vm, uint inkColor)
        {
            using (var stream = new StreamWriter(path))
            {
                for (int h = 0; h < vm.ScreenHeight; h++)
                {
                    stream.Write("DB ");
                    for (int w = 0; w < vm.ScreenWidth / 8; w++)
                    {
                        byte mask = vm.GetMaskOfByte(w, h, inkColor);
                        if (w > 0)
                        {
                            stream.Write(",");
                        }
                        stream.Write(mask);
                    }
                    stream.WriteLine();
                }
            }
        }
    }
}
