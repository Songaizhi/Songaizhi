using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using System.ComponentModel.DataAnnotations;

namespace ZDSoft.TES.Domain
{
    /// <summary>
    /// 课程
    /// </summary>
    [ActiveRecord]
    public class Curriculum : EntityBase
    {
        /// <summary>
        /// 课程
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Display(Name = "课程")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入课程")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "课程必须大于2个字符")]
        public string Name { get; set; }


        /// <summary>
        /// 课程与班级（多对多）
        /// </summary>
        [HasAndBelongsToMany(typeof(UserClass),
            Table = "Class_Curriculum",
            ColumnKey = "CurriculumID",
            ColumnRef = "ClassID",
            Cascade = ManyRelationCascadeEnum.SaveUpdate,
            Inverse = false,
            Lazy = false)]
        public IList<UserClass> Classes { get; set; }

        /// <summary>
        /// 课程与教师（多对多）
        /// </summary>
        [HasAndBelongsToMany(typeof(Teacher),
            Table = "Curriculum_Teacher",
            ColumnKey = "CurriculumID",
            ColumnRef = "TeacherID",
            Cascade = ManyRelationCascadeEnum.SaveUpdate,
            Inverse = false,
            Lazy = false)]
        public IList<Teacher> Teacheres { get; set; }
    }
}
