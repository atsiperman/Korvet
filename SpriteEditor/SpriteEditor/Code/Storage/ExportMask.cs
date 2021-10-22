using System.IO;

namespace SpriteEditor.Code.Storage
{
    static class ExportMask
    {
        public static void Save(string path, IVideoMemory vm, uint inkColor, uint maskColor)
        {
            using (var stream = new StreamWriter(path))
            {
                var width = vm.ScreenWidth;
                var height = vm.ScreenHeight / 8;
                stream.WriteLine("DB {0},{1}", width, height);
                for (var line = 0; line < vm.ScreenHeight / 8; line++)
                {
                    stream.Write("DB");
                    var firstByte = true;

                    for (int w = 0; w < vm.ScreenWidth / 8; w++)
                    {
                        var startY = line * 8;
                        for (var h = startY; h < startY + 8; h++)
                        {
                            byte mask = vm.GetMaskOfByte(w, h, maskColor);
                            byte data = vm.GetMaskOfByte(w, h, inkColor);
                            stream.Write("{0}{1},{2}", firstByte ? " " : ", ", mask, data);
                            firstByte = false;
                        }
                    }

                    stream.WriteLine();
                }
            }
        }
    }
}
