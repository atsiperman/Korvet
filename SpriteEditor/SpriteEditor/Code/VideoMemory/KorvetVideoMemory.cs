using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace SpriteEditor
{
    public class KorvetVideoMemory : IVideoMemory
    {
        #region Private members

        int m_videoWidth;
        int m_videoHeight;
        int m_bytesPerLine;

        List<SeColor> m_palette;
        List<byte[]> m_planes;

        #endregion Private members

        #region Public properties     

        public string Description { get { return "Korvet"; } }

        public int ScreenWidth { get { return m_videoWidth; } }
        public int ScreenHeight { get { return m_videoHeight; } }

        public List<SeColor> Palette { get { return m_palette; } }

        #endregion Public properties

        public KorvetVideoMemory()
        {
            m_planes = new List<byte[]>(3) { null, null, null };

            m_palette = new List<SeColor>() 
                { 
                    new SeColor() { NativeColor = 0, A = 0xFF, R = 0,    G = 0,     B = 0    },
                    new SeColor() { NativeColor = 1, A = 0xFF, R = 0,    G = 0xFF,  B = 0    },
                    new SeColor() { NativeColor = 2, A = 0xFF, R = 0xFF, G = 0,     B = 0    },
                    new SeColor() { NativeColor = 3, A = 0xFF, R = 0,    G = 0,     B = 0xFF },
                    new SeColor() { NativeColor = 4, A = 0xFF, R = 0,    G = 0xFF,  B = 0xFF },
                    new SeColor() { NativeColor = 5, A = 0xFF, R = 0xFF, G = 0xFF,  B = 0    },
                    new SeColor() { NativeColor = 6, A = 0xFF, R = 0xFF, G = 0,     B = 0xFF },
                    new SeColor() { NativeColor = 7, A = 0xFF, R = 0xFF, G = 0xFF,  B = 0xFF }
                };
        }

        #region Public methods

        public uint GetPixel(int x, int y)
        {
            int idx = GetIndexOfByte(x, y);
            int bit = 1 << (x % 8);
            uint bit0 = (uint)((m_planes[0][idx] & bit) == 0 ? 0 : 1);
            uint bit1 = (uint)((m_planes[1][idx] & bit) == 0 ? 0 : 1);
            uint bit2 = (uint)((m_planes[2][idx] & bit) == 0 ? 0 : 1);

            uint color = (uint)(bit2 << 2) | (uint)(bit1 << 1) | (uint)bit0;

            return color;
        }

        public void SetPixel(uint color, int x, int y)
        {
            int idx = GetIndexOfByte(x, y);
            byte bit = (byte)(1 << (x % 8));

            for (int k = 0; k < m_planes.Count; k++)
            {
                byte mask = m_planes[k][idx];
                uint newColor = color & (uint)(1 << k);

                if (newColor > 0)
                    mask |= bit;
                else
                    mask &= (byte)~bit;

                m_planes[k][idx] = mask;
            }
        }

        public void Fill(uint nativeColor)
        {
            for (int k = 0; k < m_planes.Count; k++)
            {
                byte newColor = (byte)((nativeColor & (uint)(1 << k)) == 0 ? 0 : 0xFF);

                for (int idx = 0; idx < m_planes[k].Length; idx++)
                {
                    m_planes[k][idx] = newColor;
                }
            }
        }

        public void SetScreenSize(int width, int height)
        {
            // FIXME: add error checking

            m_videoWidth = width;
            m_videoHeight = height;
            m_bytesPerLine = width / 8;
            for (int k = 0; k < m_planes.Count; k++)
            {
                m_planes[k] = new byte[m_bytesPerLine * height];
            }
        }

        public IVideoMemory Clone()
        {
            var clone = new KorvetVideoMemory();
            clone.CopyFrom(this);
            return clone;
        }

        public void CopyFrom(IVideoMemory clone)
        {
            //FIXME:
            var vm = (clone as KorvetVideoMemory);
            this.SetScreenSize(clone.ScreenWidth, clone.ScreenHeight);
            for (int k = 0; k < vm.m_planes.Count; k++)
            {
                vm.m_planes[k].CopyTo(m_planes[k], 0);
            }
        }

        public byte GetMaskOfByte(int x, int y, uint inkColor)
        {
            byte result = 0;
            for (int w = 0; w < 8; w++)
            {
                byte pixel = GetPixel(x * 8  + 7 - w, y) == inkColor ? (byte)1 : (byte)0;
                result |= (byte)(pixel << w);
            }
            return result;
        }

        #endregion Public methods

        #region Private methods

        int GetIndexOfByte(int x, int y)
        {
            return y * m_bytesPerLine + x / 8;
        }

        #endregion Private methods
    }
}
