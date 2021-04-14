using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(OnlineSurvey.Startup))]
namespace OnlineSurvey
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
