using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(ProgressBarInRealTime.Owin.Startup))]

namespace ProgressBarInRealTime.Owin
{
    public sealed class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR();
        }
    }
}