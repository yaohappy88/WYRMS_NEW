﻿//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace WYRMS.Domain.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SysEntities : DbContext
    {
        public SysEntities()
            : base("name=SysEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Modules> Modules { get; set; }
        public DbSet<PermissionRoles> PermissionRoles { get; set; }
        public DbSet<Permissions> Permissions { get; set; }
        public DbSet<Roles> Roles { get; set; }
        public DbSet<RoleUsers> RoleUsers { get; set; }
        public DbSet<UserGroupRoles> UserGroupRoles { get; set; }
        public DbSet<UserGroups> UserGroups { get; set; }
        public DbSet<UserGroupUsers> UserGroupUsers { get; set; }
        public DbSet<Users> Users { get; set; }
    }
}
