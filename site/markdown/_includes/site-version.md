<!-- markdownlint-disable -->
<script type="text/javascript">
  window.site = window.site || {}
  window.site.version = "{{ site.luda.siteVersion }}"
  luda.ready(function(){
    if(window.site.version != window.site.latestVersion){
      luda.toggle('#site-version-alert').activate()
    }
  })
</script>
