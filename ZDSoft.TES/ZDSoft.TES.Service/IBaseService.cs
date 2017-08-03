using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NHibernate.Criterion;
using ZDSoft.TES.Domain;
using ZDSoft.TES.Manager;

namespace ZDSoft.TES.Service
{

    /// <summary>
    /// 集成 by fxz
    /// 2011年12月30日00时02分22秒
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public interface IBaseService<T> where T : EntityBase, new() 
    {
        /// <summary>
        /// 新建
        /// </summary>
        /// <param name="entity">实体名</param>
        void Create(T entity);

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="entity">实体名</param>
        void Update(T entity);

        /// <summary>
        /// 根据ID获取
        /// </summary>
        /// <param name="ID">ID编号</param>
        /// <returns>ID</returns>
        T Get(int ID);

        /// <summary>
        /// 根据条件获取
        /// </summary>
        /// <param name="queryConditions"></param>
        /// <returns></returns>
        T Get(IList<ICriterion> queryConditions);

        /// <summary>
        /// 根据ID删除
        /// </summary>
        /// <param name="ID">ID</param>
        void Delete(int ID);

        /// <summary>
        /// 根据实体删除
        /// </summary>
        /// <param name="entity">删除</param>
        void Delete(T entity);

        #region 存在判断
        bool Exists(int id);
        bool Exists(IList<ICriterion> queryConditions);
        #endregion

        /// <summary>
        /// 获取所有
        /// </summary>
        /// <returns></returns>
        IList<T> GetAll();

        /// <summary>
        /// 获取满足条件的记录
        /// </summary>
        /// <param name="queryConditions">条件</param>
        /// <returns></returns>
        IList<T> GetAll(IList<ICriterion> queryConditions);

        /// <summary>
        /// 分页获取满足条件的记录
        /// </summary>
        /// <param name="queryConditions">条件</param>
        /// <param name="pageIndex">页码</param>
        /// <param name="pageSize">每页显示数量</param>
        /// <param name="orderField"></param>
        /// <param name="isAscending">升序 true,降序 false</param>
        /// <param name="count">数量集合数量</param>
        /// <returns></returns>
        IList<T> GetPaged(IList<ICriterion> queryConditions, IList<Order> orderList, int pageIndex, int pageSize, out int count);

        /// <summary>
        /// 获取满足条件的记录
        /// </summary>
        /// <param name="queryConditions">分页查询条件，key对应查询对象，如:TransportOrder.Receiver.Name
        /// value对应查询对象对应的值：如“李强”，key和value加并后代码TransportOrder.Receiver.Name="李强"</param>
        /// <param name="pageIndex">当前页码</param>
        /// <param name="pageSize">页面大小</param>
        /// <param name="count">满足当前条件的记录数</param>
        /// <returns>满足查询条件的实体集合</returns>
        IList<T> GetPaged(IList<QueryConditions> queryConditions, int pageIndex, int pageSize, out int count);

        /// <summary>
        /// 根据查询条件查询满足条件的记录
        /// </summary>
        /// <param name="queryConditions">查询条件</param>
        /// <returns></returns>
        IList<T> Find(IList<ICriterion> queryConditions);
    }
}
