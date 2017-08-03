using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using System.ComponentModel.DataAnnotations;

namespace ZDSoft.TES.Domain
{
     [ActiveRecord]
   public class TempTopic:EntityBase
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
         /// 比重
         /// </summary>
        [Property(NotNull = true)]
        [Required(ErrorMessage = "请输入比重")]
        [Display(Name = "比重")]
        public decimal Proportion { get; set; }

        /// <summary>
        /// 模板卷子ID
        /// </summary>  
        [BelongsTo(
            Type = typeof(TempPaperType),
            Column = "TempPaperTypeID",
            Lazy = FetchWhen.OnInvoke
            )]
        public TempPaperType TempPaperType { get; set; }
      
        /// <summary>
        /// 卷子对应多个题
        /// </summary>
        [HasMany(typeof(TempSelects),
            Table = "TempSelects",
            ColumnKey = "TempTopicID",
            Lazy = false,
            Inverse = false)]
        public IList<TempSelects> TempSelectsList { get; set; }

         /// <summary>
         /// 自调用
         /// </summary>
        [BelongsTo(Type = typeof(TempTopic),
                Column = "ParentID",
                NotNull = false,
                Cascade = CascadeEnum.None,
                Lazy = FetchWhen.OnInvoke)]
        public TempTopic Parent { get; set; }


        /// <summary>
        /// 子级ID
        /// </summary>
        [HasMany(Table = "TempTopic",
            ColumnKey = "ParentID",
            Cascade = ManyRelationCascadeEnum.None,
            Inverse = false, Lazy = false)]
        public IList<TempTopic> Children { get; set; }

    }
}
