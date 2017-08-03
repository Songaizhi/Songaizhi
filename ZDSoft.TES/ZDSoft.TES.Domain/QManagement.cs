using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using System.ComponentModel.DataAnnotations;

namespace ZDSoft.TES.Domain
{
    [ActiveRecord("QManagement")]
    public class QManagement:EntityBase
   
    {
        /// <summary>
        /// 问卷名称
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请输入问卷名称")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "字符不能超过50个字符")]
        [Display(Name = "问卷名称")]
        public string Name { get; set; }

        /// <summary>
        /// 问卷评选时间
        /// </summary>
        [Property(NotNull = true)]
        [Display(Name = "问卷评选时间")]
        public DateTime QSTime { get; set; }

        /// <summary>
        /// 评选截止时间
        /// </summary>
        [Property(NotNull = true)]
        [Display(Name = "评选截止时间")]
        public DateTime SDTime { get; set; }

        /// <summary>
        /// 是否激活
        /// </summary>
        [Property(NotNull = true)]
        [Display(Name = "是否激活")]
        public bool ISActive { get; set; }

        /// <summary>
        /// 问卷类型（对象）
        /// </summary>
        [BelongsTo(Type = typeof(TempPaperType),
            Column = "TempPaperTypeID",
            NotNull = false,
            Cascade = CascadeEnum.None,
            Lazy = FetchWhen.OnInvoke)]
        [Required(ErrorMessage = "不能为空")]
        [Display(Name = "问卷类型")]
        public TempPaperType Tpt { get; set; }

        /// <summary>
        /// 角色选择
        /// </summary>
        [Property]
        [Display(Name = "角色选择")]
        public Sys Syst { get; set; }

    }
}
