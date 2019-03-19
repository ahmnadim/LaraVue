<template>
    <div class="container">
        <div class="row mt-5">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Manage Users</h3>

                <div class="card-tools">
                    <a href="#" class="btn btn-success" data-toggle="modal" data-target="#addusermodal"><i class="fa fa-user-plus"> Add new user</i></a>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody><tr>
                    <th>ID</th>
                    <th>User</th>
                    <th>Email</th>
                    <th>Type</th>
                    <th>Created At</th>
                    <th>Action</th>
                  </tr>
                  <tr v-for="user in users">
                    <td>{{user.id}}</td>
                    <td>{{user.name}}</td>
                    <td>{{user.email}}</td>
                    <td>{{user.type | upperCase}}</td>
                    <td>{{user.created_at | diffForHumans}}</td>
                    <td>
                        <a href="#">
                            <i class="fa fa-edit blue"></i></a>
                        </a> || 

                        <a href="#">
                            <i class="fa fa-trash red"></i></a>
                        </a>
                    </td>
                  </tr>
                 
                 
                </tbody></table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="addusermodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Add new user</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form @submit.prevent="addUser">
              <div class="modal-body">
                <div class="form-group">
                   <input v-model="form.name" type="text" name="name"
                     class="form-control" :class="{ 'is-invalid': form.errors.has('name') }" placeholder="Enter Name">
                   <has-error :form="form" field="name"></has-error>
                </div> 
                <div class="form-group">
                   <input v-model="form.email" type="email" name="email"
                     class="form-control" :class="{ 'is-invalid': form.errors.has('email') }" placeholder="Enter Email">
                   <has-error :form="form" field="email"></has-error>
                </div> 
                <div class="form-group">
                   <input v-model="form.password" type="password" name="password"
                     class="form-control" :class="{ 'is-invalid': form.errors.has('password') }" placeholder="Enter Password">
                   <has-error :form="form" field="password"></has-error>
                </div>
                <div class="form-group">
                   <select v-model="form.type" name="type" id="type" 
                     class="form-control" :class="{ 'is-invalid': form.errors.has('type') }">
                     <option value="">Select User Role</option>
                     <option value="admin">Admin</option>
                     <option value="user">Standard User</option>
                     <option value="author">Author</option>
                   </select>
                   <has-error :form="form" field="type"></has-error>
                </div>
                <div class="form-group">
                   <textarea v-model="form.bio" name="bio" id="bio" class="form-control" :class="{ 'is-invalid': form.errors.has('bio') }" placeholder="Enter Bio (Optional)"></textarea>
                   <has-error :form="form" field="bio"></has-error>
                </div>
                

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Create</button>
              </div>
              </form>
            </div>
          </div>
        </div>
    </div>
</template>

<script>
    export default {
         data(){
            return {
              users:{ },
              form: new Form({
                name:'',
                email:'',
                password:'',
                type:'',
                bio:'',
                photo:''
              })
            }
         },

         methods:{
          loadUsers(){
            axios.get('api/user').then(({ data }) => (this.users = data.data));
          },

          addUser(){
            this.$Progress.start()
            this.form.post('api/user')
            this.$Progress.finish()
          }
         },

          created() {
            this.loadUsers();
        }
    }
</script>
