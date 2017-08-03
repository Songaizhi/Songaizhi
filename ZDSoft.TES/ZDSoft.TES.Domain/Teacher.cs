using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using System.ComponentModel.DataAnnotations;

namespace ZDSoft.TES.Domain
{
    /// <summary>
    /// 老师
    /// </summary>
    [ActiveRecord]
    public class Teacher : EntityBase
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
        /// 工号
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Display(Name = "工号")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入工号")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "工号名必须大于2个字符")]
        public string Number { get; set; }

        /// <summary>
        /// 教师的家常话
        /// </summary>
        [Property(NotNull = true, Length = 100)]
        [Display(Name = "教师的常话")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入教师的常话")]
        [StringLength(100, MinimumLength = 2, ErrorMessage = "教师的常话必须大于2个字符")]
        public string Spask { get; set; }

        /// <summary>
        /// 头像
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Display(Name = "头像")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请选择教师的头像")]
        public string Headportrait { get; set; }

        /// <summary>
        /// 教师与班级(多对多)
        /// </summary>
        [HasAndBelongsToMany(typeof(UserClass),
            Table = "Class_Teacher",
            ColumnKey = "TeacherID",
            ColumnRef = "ClassID",
            Cascade = ManyRelationCascadeEnum.SaveUpdate,
            Inverse = false,
            Lazy = false)]
        public IList<UserClass> UserClasses { get; set; }

        /// <summary>
        /// 教师与课程（多对多）
        /// </summary>
        [HasAndBelongsToMany(typeof(Curriculum),
            Table = "Curriculum_Teacher",
            ColumnKey = "TeacherID",
            ColumnRef = "CurriculumID",
            Cascade = ManyRelationCascadeEnum.SaveUpdate,
            Inverse = false,
            Lazy = false)]
        public IList<Curriculum> Curriculums { get; set; }

        /// <summary>
        /// 教师
        /// </summary>
        [BelongsTo(
            Type = typeof(Users),
            Column = "UserID",
            Lazy = FetchWhen.OnInvoke
            )]
        public Users Teachers { get; set; }
    }
}
