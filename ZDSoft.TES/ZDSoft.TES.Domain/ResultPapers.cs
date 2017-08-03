using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using System.ComponentModel.DataAnnotations;

namespace ZDSoft.TES.Domain
{
    /// <summary>
    /// 结果调查表
    /// </summary>
    [ActiveRecord]
    public class ResultPapers:EntityBase
    {

        /// <summary>
        /// 名字
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Display(Name = "名字")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入名字")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "名字必须大于2个字符")]
        public string Name { get; set; }

        /// <summary>
        /// 角色ID
        /// </summary>
        [Property(NotNull = true)]
        [Display(Name = " 角色ID")]
        public int RoleID { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        [Property(NotNull = true)]
        [Display(Name = "创建时间")]
        public DateTime Time { get; set; }

        /// <summary>
        /// 比例
        /// </summary>
        [Property(NotNull = true)]
        [Display(Name = "比例")]
        public decimal Proportion { get; set; }

        /// <summary>
        /// 学期
        /// </summary>
        [Property(NotNull = true, Length = 10)]
        [Display(Name = "学期")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入学期")]
        [StringLength(10, ErrorMessage = "学期出错")]
        public string Semester { get; set; }

        /// <summary>
        /// 创建用户ID
        /// </summary>
        [Property(NotNull = true)]
        [Display(Name = " 创建用户ID")]
        public int CreateUserID { get; set; }

        /// <summary>
        /// 用户ID
        /// </summary>
        [Property(NotNull = true)]
        [Display(Name = " 用户ID")]
        public int UserID { get; set; }




    }
}
