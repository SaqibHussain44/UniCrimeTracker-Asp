using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ct_project.Startup))]
namespace ct_project
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
