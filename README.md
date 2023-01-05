# PCA - Prometheus Certified associate

[Video URL]()
[Link to KodeKloud course](https://kode.wiki/3YzkrWV)
Or you can use KodeKloud playground as well.

Run promethues_setup.sh to setup prometheus
RUN Pushgateway setup pushgateway_setup.sh

Configure prometheus to scrape pushgateway

`vi /etc/prometheus/prometheus.yml`

```
  - job_name: 'pushgateway'
    honor_labels: true
    static_configs:
      - targets: ['localhost:9091']
```
