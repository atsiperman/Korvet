using Newtonsoft.Json;

namespace SpriteEditor
{
    public class SeColor
    {
        #region Private members
        #endregion Private members

        #region Public properties

        [JsonIgnore]
        public byte A { get; set; }
        [JsonIgnore]
        public byte R { get; set; }
        [JsonIgnore]
        public byte G { get; set; }
        [JsonIgnore]
        public byte B { get; set; }
        
        public uint Argb
        {
            get { return ((uint)A << 24) | ((uint)R << 16) | ((uint)G << 8) | (uint)B; }
            set
            {
                uint argb = value;
                A = (byte)((argb >> 24) & 0xFF);
                R = (byte)((argb >> 16) & 0xFF);
                G = (byte)((argb >> 8) & 0xFF);
                B = (byte)(argb & 0xFF);
            }
        }

        public uint NativeColor { get; set; }

        [JsonIgnore]
        public string Text { get { return string.Format("0x {0:X2} {1:X2} {2:X2} {3:X2}", A, R, G, B); } }
 
        #endregion Public properties
    }
}
