using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using System.ComponentModel.DataAnnotations;

namespace ZDSoft.TES.Domain
{
    /// <summary>
    /// 教师
    /// </summary>
    [ActiveRecord]
    public class Teachers:EntityBase
    {
        /// <summary>
        /// 教师名
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Display(Name = "教师名")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入教师名")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "教师名必须大于2个字符")]
        public string Name { get; set; }

        /// <summary>
        /// 课程
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Display(Name = "课程")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入课程")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "课程必须大于2个字符")]
        public string Course { get; set; }


        /// <summary>
        /// 老师与班级的映射
        /// </summary>
        [BelongsTo(
            Type = typeof(UserClass),
            Column = "ClassID",
            Lazy = FetchWhen.OnInvoke)]
        public UserClass Classes { get; set; }
    }
}
