using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using System.ComponentModel.DataAnnotations;

namespace ZDSoft.TES.Domain
{
    /// <summary>
    /// 角色
    /// </summary>
    [ActiveRecord]
    public class Role : EntityBase
    {
        /// <summary>
        /// 角色名
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Display(Name = "角色名")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入角色名")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "用户名必须大于2个字符")]
        public string Name { get; set; }

        /// <summary>
        /// 当前角色拥有的用户
        /// </summary>
        [HasAndBelongsToMany(typeof(Users), //外键表所映射的类名
            Table = "User_Role",//外键表名
            ColumnKey = "RoleID", //外键表的外键名
            ColumnRef = "UserID",
            //级联操作：当操作主表的数据时，自动更新或保存子表中的数据
            Cascade = ManyRelationCascadeEnum.None,
            Inverse = false,//是否不将列表的数据同步到数据库
            Lazy = false)//是否支持懒加载
        ]
        public IList<Users> Users { get; set; }

        /// <summary>
        /// 角色对应多个功能
        /// </summary>
        [HasAndBelongsToMany(typeof(Function),
            Table = "Role_Function",
            ColumnKey = "RoleID",
            ColumnRef = "FunctionID",
            Cascade = ManyRelationCascadeEnum.SaveUpdate,
            Inverse = false,
             Lazy = false)]
        public IList<Function> Functions { get; set; }

        public bool IsChecked { get; set; }
    }
}
