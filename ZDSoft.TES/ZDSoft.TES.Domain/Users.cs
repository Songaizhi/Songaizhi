using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using System.ComponentModel.DataAnnotations;

namespace ZDSoft.TES.Domain
{
    /// <summary>
    /// 用户
    /// </summary>
    [ActiveRecord]
    public class Users : EntityBase
    {
        /// <summary>
        /// 用户名
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Display(Name = "用户名")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入用户名")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "用户名必须大于2个字符")]
        public string Name { get; set; }

        /// <summary>
        /// 账号
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Display(Name = "账号")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入账号")]
        [StringLength(50, ErrorMessage = "账号不能超过50个字符")]
        public string Account { get; set; }

        /// <summary>
        /// 密码
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Display(Name = "密码")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入密码")]
        [StringLength(50, ErrorMessage = "密码不能超过50个字符")]
        public string PassWord { get; set; }

        /// <summary>
        /// 标识符
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Display(Name = "标识符")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入标识符")]
        [StringLength(50, ErrorMessage = "标识符不能超过50个字符")]
        public string Identifier { get; set; }

        /// <summary>
        /// 当前用户拥有的角色(多对多)
        /// </summary>
        [HasAndBelongsToMany(typeof(Role),
            Table = "User_Role",
            ColumnKey = "UserID",
            ColumnRef = "RoleID",
            Cascade = ManyRelationCascadeEnum.SaveUpdate,
            Inverse = false,
            Lazy = false)]
        public IList<Role> Roles { get; set; }
 

    }
}
