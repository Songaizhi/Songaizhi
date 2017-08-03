using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using System.ComponentModel.DataAnnotations;

namespace ZDSoft.TES.Domain
{
    /// <summary>
    /// 学院
    /// </summary>
    [ActiveRecord]
    public class College : EntityBase
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
        /// 班级
        /// </summary>
        [HasMany(typeof(UserClass),
          ColumnKey = "CollegeID",
          Lazy = false,
          Inverse = false)]
        public IList<UserClass> UserClassItem { get; set; }


    }
}
