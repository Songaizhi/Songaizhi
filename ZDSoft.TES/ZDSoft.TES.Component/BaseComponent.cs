using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZDSoft.TES.Service;
using Castle.ActiveRecord;
using ZDSoft.TES.Domain;
using NHibernate.Criterion;
using Castle.Services.Transaction;
using ZDSoft.TES.Manager;

namespace ZDSoft.TES.Component
{

    /// <summary>
    /// 集成 by fxz
    /// 2011年12月30日00时02分22秒
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class BaseComponent<T,M> : IBaseService<T> 
        where T : EntityBase, new()
        where M : ManagerBase<T>,new()
    {
        protected M manager = (M)typeof(M).GetConstructor(Type.EmptyTypes).Invoke(null);
        public virtual void Create(T entity)
        {
            manager.Create(entity);
        }

        public virtual void Update(T entity)
        {
            manager.Update(entity);
        }
        
        /// <summary>
        /// 根据ID获取对象
        /// </summary>
        /// <param name="ID"></param>
        /// <returns></returns>
        public T Get(int ID)
        {
            return manager.Get(ID);
        }

        /// <summary>
        /// 根据条件获取对象
        /// </summary>
        /// <param name="queryConditions"></param>
        /// <returns></returns>
        public T Get(IList<ICriterion> queryConditions)
        {
            return manager.Get(queryConditions);
        }

        public void Delete(int ID)
        {
            manager.Delete(ID);
        }

        public void Delete(T entity)
        {
            manager.Delete(entity);
        }


        #region 存在判断
        public bool Exists(int id)
        {
            return manager.Exists(id);
        }

        public bool Exists(IList<ICriterion> queryConditions)
        {
            return manager.Exists(queryConditions);
        }
        #endregion 


        public IList<T> GetAll()
        {
            return manager.GetAll();
        }

        public IList<T> GetAll(IList<NHibernate.Criterion.ICriterion> queryConditions)
        {
            return manager.GetAll(queryConditions);
        }

        public IList<T> GetPaged(IList<ICriterion> queryConditions, IList<Order> orderList, int pageIndex, int pageSize, out int count)
        {
            return manager.GetPaged(queryConditions, orderList, pageIndex, pageSize, out count);
        }

        public IList<T> Find(IList<ICriterion> queryConditions)
        {
            return manager.Find(queryConditions);
        }

        public IList<T> GetPaged(IList<QueryConditions> queryConditions, int pageIndex, int pageSize, out int count)
        {
            return manager.GetPaged(queryConditions, pageIndex, pageSize, out count);
        }

    }
}
