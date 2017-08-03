using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using System.ComponentModel.DataAnnotations;

namespace ZDSoft.TES.Domain
{
    /// <summary>
    /// 模板卷子
    /// </summary>
     [ActiveRecord]
   public class TempPaperType:EntityBase
    {

        /// <summary> 
        /// 模板卷子表名
        /// </summary>
        [Property(NotNull = true, Length = 20)]
        [Required(AllowEmptyStrings = false, ErrorMessage = "不能为空")]
        [StringLength(20, ErrorMessage = "不能超过20个字符")]
        [Display(Name = " 模板卷子表名")]
        public string Name { get; set; }


        /// <summary>
        /// 卷子对应多个题
        /// </summary>
        [HasMany(typeof(TempTopic),
            Table = "TempTopic",
            ColumnKey = "TempPaperTypeID",
            Lazy = false,
            Inverse = false)]
        public IList<TempTopic> TempPaperTypeList { get; set; }

        /// <summary>
        /// 角色对应多个模板卷子
        /// </summary>
        [BelongsTo(
            Type = typeof(Role),
            Column = "RoleID",
            Lazy = FetchWhen.OnInvoke
            )]
        public Role ResultPapers { get; set; }


    }
}
