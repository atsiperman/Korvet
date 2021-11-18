using System.ComponentModel;

namespace SpriteEditor.ViewModels
{
    class BaseViewModel : INotifyPropertyChanged
    {
        #region Public properties

        public event PropertyChangedEventHandler PropertyChanged;

        #endregion Public properties

        #region Protected methods

        protected void FirePropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }

        #endregion Protected methods
    }
}
