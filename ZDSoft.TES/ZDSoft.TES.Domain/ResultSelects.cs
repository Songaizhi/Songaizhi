using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using System.ComponentModel.DataAnnotations;

namespace ZDSoft.TES.Domain
{
    /// <summary>
    /// 结果选择表
    /// </summary>
    [ActiveRecord]
    public class ResultSelects : EntityBase
    {
        /// <summary>
        /// 名字
        /// </summary>
        [Property(NotNull = true, Length = 1000)]
        [Display(Name = "名字")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入名字")]
        [StringLength(1000, MinimumLength = 10, ErrorMessage = "名字必须大于10个字符")]
        public string Name { get; set; }

        /// <summary>
        /// 编号（ABCD）
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Display(Name = "编号")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入编号")]
        [StringLength(50, MinimumLength = 1, ErrorMessage = "名字必须大于1个字符")]
        public string Number { get; set; }


        /// <summary>
        /// 比例
        /// </summary>
        [Property(NotNull = true)]
        [Display(Name = "比例")]
        public decimal Proportion { get; set; }



        /// <summary>
        /// 创建用户ID
        /// </summary>
        [Property(NotNull = true)]
        [Display(Name = " 创建用户ID")]
        public int CreateUserID { get; set; }



    }
}
