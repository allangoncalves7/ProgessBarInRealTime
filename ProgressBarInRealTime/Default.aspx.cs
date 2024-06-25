using Microsoft.AspNet.SignalR;
using ProgressBarInRealTime.Hubs;
using System;

namespace ProgressBarInRealTime
{
    public partial class Deafault : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            var count = 10;

            for (int i = 0; i <= count; i++)
            {
                int percent = (int)(((double)i/ count) * 100);
                var progressHub = GlobalHost.ConnectionManager.GetHubContext<ProgressHub>();
                progressHub.Clients.All.updateProgress(percent);
                System.Threading.Thread.Sleep(1000);
            }
        }
    }
}