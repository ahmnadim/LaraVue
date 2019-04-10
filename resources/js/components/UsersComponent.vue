<template>
    <div class="container">
        <div class="row mt-5">
          <div class="col-md-12">
             <div class="card" v-if="!Gate.adminOrAuthor()">
               <not-found></not-found>
               <h1>NOT FOUND</h1>
             </div>
            <div class="card" v-if="Gate.adminOrAuthor()">
              <div class="card-header">
                <h3 class="card-title">Manage Users</h3>

                <div class="card-tools">
                    <a href="#" class="btn btn-success"  @click="addNew"><i class="fa fa-user-plus"> Add new user</i></a>
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
                  <tr v-for="user in users.data">
                    <td>{{user.id}}</td>
                    <td>{{user.name}}</td>
                    <td>{{user.email}}</td>
                    <td>{{user.type | upperCase}}</td>
                    <td>{{user.created_at | diffForHumans}}</td>
                    <td>
                        <a href="#" @click="editUser(user)" >
                            <i class="fa fa-edit blue"></i></a>
                        </a> || 

                        <a href="#" @click="deleteUser(user.id)">
                            <i class="fa fa-trash red"></i></a>
                        </a>
                    </td>
                  </tr>
                 
                 
                </tbody></table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
                <pagination :data="users" @pagination-change-page="getResults"></pagination>
              </div>
            </div>
            <!-- /.card -->
          </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="addusermodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle" v-show="!editMode">Add new user</h5>
                <h5 class="modal-title" id="exampleModalLongTitle" v-show="editMode">Edit User's Info</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form @submit.prevent="editMode ? updateUser() : addUser()">
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
                <button type="submit" class="btn btn-primary" v-show="!editMode">Create</button>
                <button type="submit" class="btn btn-success" v-show="editMode">Update</button>
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
              editMode: false,
              users:{ },
              form: new Form({
                id:'',
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

          getResults(page = 1) {
            axios.get('api/user?page=' + page)
              .then(response => {
                this.users = response.data;
              });
          },

          updateUser(){
            this.$Progress.start();
            this.Progress
            this.form.put('api/user/'+this.form.id)
            .then(() => {
              toast.fire({
                type: 'success',
                title: 'User info updated successfully,'
              });
              $('#addusermodal').modal('hide');
              this.$Progress.finish();
               fire.$emit('LoadInfo');

            })
            .catch(() => {
               this.$Progress.fail();
            });
          },

          editUser(user){
            this.editMode = true;
            this.form.reset();
            $('#addusermodal').modal('show');
            this.form.fill(user);
          },

          addNew(){
            this.editMode = false;
            this.form.reset();
            $('#addusermodal').modal('show');
          },

          deleteUser(id){
            swal.fire({
              title: 'Are you sure?',
              text: "You won't be able to revert this!",
              type: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
              if (result.value) {
                this.form.delete('api/user/'+id).then(()=> {
                  fire.$emit('LoadInfo');
                    swal.fire(
                      'Deleted!',
                      'User has been deleted.',
                      'success'
                    )
                }).catch(() => {
                  swal('Failed!', 'There is something wrong.', 'warning');
                });
                
              }
            })
          },

          loadUsers(){
            if (this.Gate.adminOrAuthor()) {
            axios.get('api/user').then(({ data }) => (this.users = data));

            }
          },

          addUser(){
            this.$Progress.start()
            this.form.post('api/user')
            .then(() => {
              fire.$emit('LoadInfo');
              $('#addusermodal').modal('hide')
              toast.fire({
                type: 'success',
                title: 'User Added successfully'
            })
            this.$Progress.finish()
            })
            
          }
         },

          created() {
            this.loadUsers();
            fire.$on('LoadInfo', () => {
              this.loadUsers();
            });
        }
    }
</script>
