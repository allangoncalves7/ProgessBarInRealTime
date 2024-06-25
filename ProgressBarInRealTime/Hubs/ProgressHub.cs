using Microsoft.AspNet.SignalR;

namespace ProgressBarInRealTime.Hubs
{
    public class ProgressHub : Hub
    {
        public void SendProgress(int percent)
        {
            Clients.All.updateProgress(percent);
        }
    }
}