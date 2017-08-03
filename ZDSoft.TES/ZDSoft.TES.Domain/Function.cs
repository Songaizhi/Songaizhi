using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using System.ComponentModel.DataAnnotations;

namespace ZDSoft.TES.Domain
{
    /// <summary>
    /// 功能
    /// </summary>
    [ActiveRecord("[Function]")]
    public class Function : EntityBase
    {

        /// <summary>
        /// 系统功能名称
        /// </summary>
        [Property(NotNull = true, Length = 20)]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请输入功能模块名称")]
        [StringLength(20, MinimumLength = 2, ErrorMessage = "字符不能超过20个字符")]
        [Display(Name = "系统功能名称")]
        public string SystemFunctionName { get; set; }

        /// <summary>
        /// 类名
        /// </summary>
        [Property(NotNull = false, Length = 200)]
        [StringLength(200, ErrorMessage = "不能超过200个字符")]
        [Display(Name = "类名")]
        public string ClassName { get; set; }

        /// <summary>
        /// 控制器名称
        /// </summary>
        [Property(NotNull = false, Length = 50)]
        [StringLength(50, ErrorMessage = "不能超过50个字节")]
        [Display(Name = "控制器名称")]
        public string ControllerName { get; set; }

        /// <summary>
        /// Action名称
        /// </summary>
        [Property(NotNull = false, Length = 200)]
        [StringLength(200, ErrorMessage = "不能超过200个字节")]
        [Display(Name = "Action名称")]
        public string ActionName { get; set; }

        /// <summary>
        /// 系统功能ID多对多对应多个角色
        /// </summary>
        [HasAndBelongsToMany(typeof(Role),
          Table = "Role_Function",
          ColumnKey = "FunctionID",
          ColumnRef = "RoleID",
          Cascade = ManyRelationCascadeEnum.SaveUpdate,
          Inverse = false,
          Lazy = false)]
        public IList<Role> Roles { get; set; }


        ///// <summary>
        ///// 父级ID:外键
        ///// Column：当前外键列名
        ///// table：属于主键表的表名
        ///// Cascade：数据表之间的级联操作，通常使用CascadeEnum.None
        ///// Lazy：延迟加载/懒加载+
        ///// </summary>
        [BelongsTo(Type = typeof(Function),
            Column = "ParentID",
            NotNull = false,
            Cascade = CascadeEnum.None,
            Lazy = FetchWhen.OnInvoke)]
        [Required(ErrorMessage = "不能为空")]
        public Function Parents { get; set; }


        /// <summary>
        /// 子级ID
        /// </summary>
        [HasMany(Table = "Function",
            ColumnKey = "ParentID",
            Cascade = ManyRelationCascadeEnum.None,
            Inverse = false, Lazy = false)]
        public IList<Function> Children { get; set; }
    }
}
