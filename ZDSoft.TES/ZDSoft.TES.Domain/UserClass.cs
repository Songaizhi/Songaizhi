using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.ActiveRecord;
using System.ComponentModel.DataAnnotations;

namespace ZDSoft.TES.Domain
{
    /// <summary>
    /// 班级
    /// </summary>
    [ActiveRecord]
    public class UserClass:EntityBase
    {
        /// <summary>
        /// 班级名
        /// </summary>
        [Property(NotNull = true, Length = 50)]
        [Display(Name = "班级名")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "请时输入班级名")]
        [StringLength(50, MinimumLength = 3, ErrorMessage = "班级名必须大于3个字符")]
        public string Name { get; set; }


        //<summary>
        //系部
        //</summary>
        [BelongsTo(
            Type = typeof(College),
            Column = "CollegeID",
            Lazy = FetchWhen.OnInvoke)]
        public College BeLongCollege { get; set; }

        /// <summary>
        /// 学生与班级
        /// </summary>
        [HasMany(typeof(Student),
          ColumnKey = "ClassID",
          Lazy = false,
          Inverse = false)]
        public IList<Student> Students { get; set; }

        /// <summary>
        /// 班级与课程（多对多）
        /// </summary>
        [HasAndBelongsToMany(typeof(Curriculum),
            Table = "Class_Curriculum",
            ColumnKey = "ClassID",
            ColumnRef = "CurriculumID",
            Cascade = ManyRelationCascadeEnum.SaveUpdate,
            Inverse = false,
            Lazy = false)]
        public IList<Curriculum> Curriculums { get; set; }

        /// <summary>
        /// 班级与教师（多对多）
        /// </summary>
        [HasAndBelongsToMany(typeof(Teacher),
            Table = "Class_Teacher",
            ColumnKey = "ClassID",
            ColumnRef = "TeacherID",
            Cascade = ManyRelationCascadeEnum.SaveUpdate,
            Inverse = false,
            Lazy = false)]
        public IList<Teacher> Teachers { get; set; }

    }
}
