<template>
  <div class="box-shadow menu-container bg-white">
    <h4>{{ dict.system_menu }}</h4>
    <el-tree
      :data="menus"
      :props="treeProps"
      node-key="id"
      default-expand-all
      :expand-on-click-node="false"
      ref="tree"
    >
      <span class="custom-tree-node" slot-scope="{ node, data }">
        <span>{{ node.label }}</span>
        <span>
          <el-button
            type="text"
            size="mini"
            @click="toAdd(data)">
            {{ dict.action_add_menu }}
          </el-button>
          <el-button
            v-if="data.path"
            type="text"
            size="mini"
            @click="toEdit(data)">
            {{ dict.action_edit }}
          </el-button>

          <el-popconfirm
            v-if="data.path"
            icon="el-icon-warning-outline"
            :title="dict.confirm_delete"
            :confirmButtonText="dict.action_delete"
            :cancelButtonText="dict.cancel"
            @onConfirm="del(data)"
          >
            <el-button
              slot="reference"
              type="text"
              size="mini">
              {{ dict.action_delete }}
            </el-button>
          </el-popconfirm>

        </span>
      </span>
    </el-tree>

    <e-form @updated="onUpdate" ref="form"></e-form>
  </div>

</template>

<script>
import eForm from './components/eForm'
import { del as deleteMenu } from '@/api/menu'

export default {
  components: {
    eForm,
  },
  data() {
    return {
      treeProps: {
        label: 'name',
      }
    }

  },
  computed: {
    menus() {
      let menus = this.$store.state.menus.menus;
      let addLocaleName = function(menus, dict) {
        menus.forEach(m => {
          m.name = dict[m.code];
          if(m.children)
            addLocaleName(m.children, dict);
        })
      }
      addLocaleName(menus, this.dict);
      return [
        {
          name: this.dict.menu_root, //根菜单
          children: menus
        }
      ];
    },


  },
  methods: {
    toAdd(data) {
      this.$refs.form.show('add', data);
    },
    toEdit(data) {
      // this.LOG('edit', node.id)
      if(data.parent) {
        let node = this.$refs.tree.getNode(data.parent);
        data.parentName = node.label;
      } else {
        data.parentName = this.dict.menu_root;
      }
      this.$refs.form.show('edit', data);
    },
    del(data) {
      deleteMenu(data.id).then(resp => {
        if(this.IS_SUCCEED(resp)) {
          this.onUpdate();
        } else {
          this.$notify.error(resp.msg);
        }
      }).catch(err => {
        this.ERROR('del menu error', err);
      })
    },
    onUpdate() {
      this.$store.dispatch('menus/RELOAD_MENUS');
    }

  },


  created() {
  }
}

</script>

<style scoped>
.menu-container{
  margin: 10px auto;
  padding: 10px 20px;
  width: 860px;
  min-height: 500px;
}
.custom-tree-node span{
  margin-right: 30px;
}

</style>



