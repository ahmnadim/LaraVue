<style>
    .widget-user-header{
        background-position: center center;
        background-size: cover;
        height: 250px;
    }
</style>
<template>
<div class="container">
        <div class="row">
            <div class="col-md-12 mt-3">
                <div class="card card-widget widget-user">
                <!-- Add the bg color to the header using any of the bg-* classes -->
                <div class="widget-user-header text-white" style="background-image:url('./img/photo4.jpg'); height:250px;">
                    <h3 class="widget-user-username">{{form.name}}</h3>
                    <h5 class="widget-user-desc">{{form.type}}</h5>
                </div>
                <div class="widget-user-image">
                    <img class="img-circle" :src="userProfilePhoto()" alt="User Avatar">
                </div>
                <div class="card-footer">
                    <div class="row">
                    <div class="col-sm-4 border-right">
                        <div class="description-block">
                        <h5 class="description-header">3,200</h5>
                        <span class="description-text">SALES</span>
                        </div>
                        <!-- /.description-block -->
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 border-right">
                        <div class="description-block">
                        <h5 class="description-header">13,000</h5>
                        <span class="description-text">FOLLOWERS</span>
                        </div>
                        <!-- /.description-block -->
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4">
                        <div class="description-block">
                        <h5 class="description-header">35</h5>
                        <span class="description-text">PRODUCTS</span>
                        </div>
                        <!-- /.description-block -->
                    </div>
                    <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                </div>
            </div>

            <!-- tab -->

            <div class="col-md-12">
                <div class="card">
                    <div class="card-header p-2">
                        <ul class="nav nav-pills">
                        <li class="nav-item"><a class="nav-link" href="#activity" data-toggle="tab">Activity</a></li>
                        <li class="nav-item"><a class="nav-link active show" href="#settings" data-toggle="tab">Settings</a></li>
                        </ul>
                    </div><!-- /.card-header -->
                    <div class="card-body">
                        <div class="tab-content">
                            <!-- Activity Tab -->
                            <div class="tab-pane" id="activity">
                                <h3 class="text-center">Display User Activity</h3>
                            </div>
                            <!-- Setting Tab -->
                            <div class="tab-pane active show" id="settings">
                                <form class="form-horizontal">
                                <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">Name</label>

                                    <div class="col-sm-12">
                                    <input type="text" v-model="form.name" class="form-control" :class="{ 'is-invalid': form.errors.has('name') }" id="inputName" placeholder="Name" >
                                    <has-error :form="form" field="name"></has-error>
                                    
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                                    <div class="col-sm-12">
                                    <input type="email" v-model="form.email" class="form-control" :class="{ 'is-invalid': form.errors.has('email') }" id="inputEmail" placeholder="Email" >
                                     <has-error :form="form" field="email"></has-error>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="inputExperience" class="col-sm-2 control-label">Bio</label>

                                    <div class="col-sm-12">
                                    <textarea  class="form-control" :class="{ 'is-invalid': form.errors.has('bio') }" v-model="form.bio" id="inputExperience" placeholder="Experience" ></textarea>
                                    <has-error :form="form" field="bio"></has-error> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="photo" class="col-sm-2 control-label">Profile Photo</label>
                                    <div class="col-sm-12">
                                        <input type="file" :class="{ 'is-invalid': form.errors.has('photo') }" v-on:change="UpdatePhoto" name="photo" class="form-input">
                                        <has-error :form="form" field="photo"></has-error>
                                    </div>
                                        
                                </div>

                                <div class="form-group">
                                    <label for="password" class="col-sm-12 control-label">Password (leave empty if not changing)</label>

                                    <div class="col-sm-12">
                                    <input type="password" :class="{ 'is-invalid': form.errors.has('password') }" v-model="form.password" class="form-control" id="password" placeholder="Password">
                                     <has-error :form="form" field="password"></has-error>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-12">
                                    <button  type="submit" @click.prevent="UpdatInfo" class="btn btn-success">Update</button>
                                    </div>
                                </div>
                                </form>
                            </div>
                        <!-- /.tab-pane -->
                        </div>
                        <!-- /.tab-content -->
                    </div><!-- /.card-body -->
                </div>
                <!-- /.nav-tabs-custom -->
          </div>
          <!-- end tabs -->
        </div>
    </div>
</template>

<script>
    export default {

        data(){
            return {
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

            userProfilePhoto(){
            
                // let prefix = (this.form.photo.match(/\//) ? '' : '/img/profile/');
                // return prefix + this.form.photo;

                let photo = (this.form.photo.length > 200) ? this.form.photo : '/img/profile/'+this.form.photo;
                return photo;
            },

            UpdatInfo(){
                this.$Progress.start();
                if(this.form.password == ""){
                    this.form.password = undefined;
                }
                this.form.put('api/profile')
                .then(() => {
                    this.$Progress.finish();
                     toast.fire({
                        type: 'success',
                        title: 'Profile info updated successfully,'
                      });
                })
                .catch(() => {
                    this.$Progress.fail();
                });
            },

            UpdatePhoto(e){
                var file = e.target.files[0];
                
                var reader = new FileReader();
                if(file.size < 2111775){
                    reader.onloadend = (file) => {
                        this.form.photo = reader.result;
                    }
                    reader.readAsDataURL(file);
                }
                else
                {
                  swal.fire(
                      'Oops!',
                      'This file is too big.',
                      'error'
                    )  
                }
            }
        },

        mounted() {
            console.log('Component mounted.')
        },

        created(){
            axios.get('api/profile')
            .then(({data}) => {this.form.fill(data)});
        }
    }
</script>
