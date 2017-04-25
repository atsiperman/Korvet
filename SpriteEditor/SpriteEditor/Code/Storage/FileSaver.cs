using Newtonsoft.Json;
using SpriteEditor.Code.Storage;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SpriteEditor.Code
{
    static class FileSaver
    {
        class NativeEditorFileFormat
        {
            public List<SeColor> Palette { get; set; }
            public int Width { get; set; }
            public int Height { get; set; }
            public uint[] Data { get; set; }
        }

        public static void Save(EditorSettings editor, string path, uint nativeColor)
        {
            var ext = Path.GetExtension(path);
            switch (ext)
            {
                case ".spr":
                    SaveNative(editor, path);
                    break;

                case ".msk":
                    ExportMask.Save(path, editor.VideoMemory, nativeColor);
                    break;

                default:
                    break;
            }
        }

        private static void SaveNative(EditorSettings editor, string path)
        {
            var data = new NativeEditorFileFormat()
            {
                Palette = editor.Palette,
                Width = editor.VideoMemory.ScreenWidth,
                Height = editor.VideoMemory.ScreenHeight,
            };
            data.Data = new uint[data.Width * data.Height];
            for (int h = 0; h < data.Height; h++)
            {
                for (int w = 0; w < data.Width; w++)
                {
                    var b = editor.VideoMemory.GetPixel(w, h);
                    data.Data[h * data.Width + w] = b;
                }
            }
            using (var writer = new StreamWriter(path))
            {
                var str = JsonConvert.SerializeObject(data);
                writer.WriteLine(str);
            }
        }

        public static EditorSettings Read(string path)
        {
            var json = string.Empty;
            using (var reader = new StreamReader(path))
            {
                json = reader.ReadToEnd();    
            }
            var data = (NativeEditorFileFormat)JsonConvert.DeserializeObject(json, typeof(NativeEditorFileFormat));
            var editor = new EditorSettings();
            editor.Palette = data.Palette;
            editor.VideoMemory = new KorvetVideoMemory();
            editor.VideoMemory.SetScreenSize(data.Width, data.Height);

            for (int h = 0; h < data.Height; h++)
            {
                for (int w = 0; w < data.Width; w++)
                {
                    editor.VideoMemory.SetPixel(data.Data[h * data.Width + w], w, h);
                }
            }
            return editor;
        }
    }
}
