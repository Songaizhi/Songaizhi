using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using System.ComponentModel.DataAnnotations;

namespace ZDSoft.TES.Domain
{
    /// <summary>
    /// 学生
    /// </summary>
    [ActiveRecord]
    public class Student : EntityBase
    {
        /// <summary>
        /// 学生名
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Display(Name = "学生名")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入学生名")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "学生名必须大于2个字符")]
        public string Name { get; set; }

        /// <summary>
        /// 学号
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Display(Name = "学号")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入学号")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "学生名必须大于2个字符")]
        public string No { get; set; }

        [BelongsTo(
        Type = typeof(Users),
        Column = "UserID",
        Lazy = FetchWhen.OnInvoke
        )]
        public Users Students { get; set; }

        //<summary>
        //班级
        //</summary>
        [BelongsTo(
            Type = typeof(UserClass),
            Column = "ClassID",
            Lazy = FetchWhen.OnInvoke)]
        public UserClass Classes { get; set; }


    }
}
