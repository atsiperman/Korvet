﻿using SpriteEditor.Code.Enums;
using System.IO;

namespace SpriteEditor.Code.Storage
{
    static class ExportData
    {
        public static void Save(string path, IVideoMemory vm, uint inkColor, uint maskColor, ImageType imageType)
        {
            switch (imageType)
            {
                case ImageType.Sprite:
                    SaveSprite(path, vm, inkColor, maskColor);
                    break;

                case ImageType.BackgroundTile:
                    SaveBackgroundTile(path, vm, inkColor);
                    break;

                case ImageType.StaticObject:
                    StaticObject(path, vm, inkColor, 3);
                    break;

                case ImageType.Text:
                    SaveText(path, vm, inkColor);
                    break;

                default:
                    break;
            }
        }

        private static void SaveText(string path, IVideoMemory vm, uint inkColor)
        {
            using (var stream = new StreamWriter(path))
            {
                for (int xPos = 0; xPos < vm.ScreenWidth / 8; xPos++)
                {
                    stream.Write("db");
                    for (var yPos = 0; yPos < vm.ScreenHeight; yPos++)
                    {
                        byte data = vm.GetMaskOfByte(xPos, yPos, inkColor);
                        stream.Write("{0} {1}", yPos == 0 ? "" : ",", data);
                    }
                    stream.WriteLine();
                }
            }
        }

        private static void SaveSprite(string path, IVideoMemory vm, uint inkColor, uint maskColor)
        {
            using (var stream = new StreamWriter(path))
            {
                var width = vm.ScreenWidth / 8;
                var height = vm.ScreenHeight / 8;
                stream.WriteLine("db {0},{1}", height, width);
                for (var line = 0; line < vm.ScreenHeight / 8; line++)
                {
                    stream.Write("db");
                    var firstByte = true;

                    for (int w = 0; w < vm.ScreenWidth / 8; w++)
                    {
                        var startY = line * 8;
                        for (var h = startY; h < startY + 8; h++)
                        {
                            byte mask = vm.GetMaskOfByte(w, h, maskColor);
                            byte data = vm.GetMaskOfByte(w, h, inkColor);
                            stream.Write("{0}{1},{2} ", firstByte ? " " : ", ", mask, data);
                            firstByte = false;
                        }
                    }

                    stream.WriteLine();
                }
            }
        }

        private static void SaveBackgroundTile(string path, IVideoMemory vm, uint inkColor)
        {
            using (var stream = new StreamWriter(path))
            {
                stream.Write("db ");
                var firstByte = true;
                for (int w = 0; w < vm.ScreenWidth / 8; w++)
                {
                    for (var h = 0; h < 8; h++)
                    {
                        byte data = vm.GetMaskOfByte(w, h, inkColor);
                        stream.Write("{0}{1} ", firstByte ? " " : ", ", data);
                        firstByte = false;
                    }
                }

                stream.WriteLine();
            }
        }

        private static void StaticObject(string path, IVideoMemory vm, uint inkColor, uint paperColor)
        {
            using (var stream = new StreamWriter(path))
            {
                var width = vm.ScreenWidth / 8;
                var height = vm.ScreenHeight;
                stream.WriteLine("db {0},{1}", width, height);
                for (var line = 0; line < vm.ScreenHeight; line++)
                {
                    stream.Write($"db {inkColor}");
                    for (int w = 0; w < width; w++)
                    {
                        byte data = vm.GetMaskOfByte(w, line, inkColor);
                        stream.Write($", {data}");
                    }

                    stream.WriteLine($", {paperColor} ");
                }
            }
        }
    }
}
