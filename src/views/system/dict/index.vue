<template>
  <div class="box-shadow mt-10" style="width: 70%; margin:auto">
    <el-row type="flex" justify="center">
      <el-col class="bg-white pt-10">
        <el-input @input="queryDicts" v-model="query" class="m-10" style="width:200px;" prefix-icon="el-icon-search" :placeholder="dict.placeholder_search"/>
        <el-button @click="toAddDict" size="medium" type="primary"><i class="el-icon-plus"></i>{{ dict.action_add }}</el-button>
      </el-col>
    </el-row>
    <el-row type="flex" justify="center">
      <el-col>
        <el-table
          :data="dicts"
          v-el-table-infinite-scroll="fetchDicts"
          infinite-scroll-delay="500"
          :loading="loading"
          height="700px"
        >
          <el-table-column :show-overflow-tooltip="true" width="50" type="index"></el-table-column>
          <el-table-column :show-overflow-tooltip="true" width="150" prop="key" :label="dict.label_key"></el-table-column>
          <el-table-column :show-overflow-tooltip="true" width="180" prop="value" :label="dict.label_value"></el-table-column>
          <el-table-column :show-overflow-tooltip="true" width="150" :label="dict.label_locale">
            <template slot-scope="scope">
              {{ localeMap[scope.row.locale ]}}
            </template>
          </el-table-column>
          <el-table-column :show-overflow-tooltip="true" prop="desc" :label="dict.label_desc"></el-table-column>
          <el-table-column width="150" :label="dict.label_action">
            <template slot-scope="scope">
              <a @click="toEditDict(scope.row.key)" href="javascript:void(0);">{{ dict.action_edit }}</a>

              <el-popconfirm
                icon="el-icon-warning-outline"
                :title="dict.confirm_delete"
                :confirmButtonText="dict.action_delete"
                :cancelButtonText="dict.cancel"
                @onConfirm="del(scope.row.key)"
              >
                <a slot="reference">{{ dict.action_delete }}</a>
              </el-popconfirm>

            </template>
          </el-table-column>
        </el-table>
      </el-col>
    </el-row>
    <!-- form -->
    <e-form @updated="reload" ref="form"></e-form>
  </div>

</template>

<script>
import eForm from './components/eForm'
import { query, del as deleteDict } from '@/api/dict'
import { mapState } from 'vuex'
import mixins from '@/mixins'

export default {
  components: {
    eForm,
  },
  mixins: [
    mixins,
  ],

  data() {
    return {
      dicts: [],
      query: '',
    }
  },
  computed: {
    ...mapState({
      localeMap: state => {
        let map = {};
        state.i18n.supportLocales.forEach(loc => {
          map[loc.key] = loc.value;
        })
        return map;
      }
             })
  },
  created() {
    this.pageSize = 50;
  },
  methods: {
    fetchDicts() {
      // this.LOG('fetch', this.totalCount, this.dicts.length, this.query);
      if(this.totalCount !== -1 && this.dicts.length === this.totalCount)
        return; //没有更多
      let params = {
        pageNo: this.pageNo,
        pageSize: this.pageSize,
      }
      if(this.query !== '')
        params.query = this.query;
      query(params).then(resp => {
        this.dicts = this.dicts.concat(resp.data.results);
        this.totalCount = resp.data.totalCount;
        this.pageNo = this.pageNo + 1;
      }).catch(err => {
        this.LOG('query dicts get error', err);
      })
    },
    queryDicts() {
      // this.LOG('query event')
      //reset
      this.pageNo = 1;
      this.dicts = [];
      this.totalCount = -1;
      this.fetchDicts();
    },
    del(key) {
      this.LOG('del', key);
      this.loading = true;
      deleteDict(key).then(resp => {
        if(this.isSucceed(resp)) {
          this.reload();
        } else {
          this.$notify,error(resp.msg)
        }

        this.loading = false;
      }).catch(err => {
        this.LOG('del dict err', err);
        this.loading = false;
      })

    },
    toAddDict() {
      this.LOG('ref', this.$refs['form']);
      this.$refs['form'].show('add');
    },
    toEditDict(key) {
      this.$refs['form'].show('edit', key);
    },
    reload() {
      this.queryDicts();
    },

  }

}

</script>

<style scoped>

</style>
