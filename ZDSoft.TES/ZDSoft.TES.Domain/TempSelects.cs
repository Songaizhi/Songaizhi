using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using System.ComponentModel.DataAnnotations;

namespace ZDSoft.TES.Domain
{
    /// <summary>
    /// 模板选择表
    /// </summary>
     [ActiveRecord]
   public class TempSelects:EntityBase
    {
         /// <summary>
        /// 名称
         /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Required(ErrorMessage = "请输入名称")]
        [StringLength(50, ErrorMessage = "不能超过50个字符")]
        [Display(Name = "名称")]
        public string Name { get; set; }

         /// <summary>
        /// 号码
         /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Required(ErrorMessage = "请输入号码")]
        [StringLength(50, ErrorMessage = "不能超过50个字符")]
        [Display(Name = "号码")]
        public string Number { get; set; }

         /// <summary>
         /// 比重
         /// </summary>
        [Property(NotNull = true)]
        [Required(ErrorMessage = "请输入比重")]
        [Display(Name = "比重")]
        public decimal Proportion { get; set; }


        [BelongsTo(Type = typeof(TempTopic),
                Column = "TempTopicID",
                NotNull = false,
                Cascade = CascadeEnum.None,
                Lazy = FetchWhen.OnInvoke)]
        public TempTopic TempTopic { get; set; }
    }
}
