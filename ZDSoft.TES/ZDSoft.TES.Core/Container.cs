using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.Windsor.Configuration.Interpreters;
using Castle.Windsor;
using Castle.MicroKernel;
using Castle.Core.Resource;
using Castle.DynamicProxy;
using System.Reflection;
using System.Xml.Linq;

namespace ZDSoft.TES.Core
{
    public class Container
    {
        private static Container instance;
        private static XDocument xml;

        //单例模式
        public static Container Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new Container();
                }
                if (xml == null)
                {
                    xml = XDocument.Load(AppDomain.CurrentDomain.BaseDirectory + "/Configuration/LMSConfiguration.xml");
                }
                return instance;
            }
        }

        public T Resolve<T>()
            where T : class
        {
            return GetComponentInstance<T>(typeof(T).Name);
        }

        public T GetComponentInstance<T>(string service)
            where T:class
        {
            if (xml == null)
            {

            }
            var element = (from p in xml.Root.Elements("element")
                           where p.Attribute("Id").Value.Equals(service)
                           select new
                           {
                               serviceNamespace = p.Attribute("Service").Value,
                               classNamespace = p.Attribute("Class").Value
                           }).FirstOrDefault();
            if (string.IsNullOrEmpty(element.classNamespace))
            {
                throw new Exception("配置文件结点" + service + "出错！");
            }
            string[] configs = element.classNamespace.Split(',');
            if (configs.Length != 2)
            {
                throw new Exception("配置文件结点" + service + "出错！");
            }

            ProxyGenerator generator = new ProxyGenerator();
            T t = (T)Assembly.Load(configs[1].Trim()).CreateInstance(configs[0].Trim());

            //t = generator.CreateInterfaceProxyWithTarget<T>(t, new ZDSoft.LMS.Core.Interceptor());
            return t;
        }

        public void Dispose()
        {
            instance = null;
            xml = null;
        }
    }
}
