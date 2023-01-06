# PCA - Prometheus Certified associate

[Video URL](https://youtu.be/DWq8M3iN_O0)

[Link to KodeKloud course](https://kode.wiki/3YzkrWV)

Or you can use KodeKloud playground as well.

Run promethues_setup.sh to setup prometheus
RUN Pushgateway setup pushgateway_setup.sh
RUN `pip install prometheus_client` and `pip install schedule`

Configure prometheus to scrape pushgateway

`vi /etc/prometheus/prometheus.yml`

```
  - job_name: 'pushgateway'
    honor_labels: true
    static_configs:
      - targets: ['localhost:9091']
```

<img width="535" alt="Screenshot 2023-01-05 at 5 53 49 PM" src="https://user-images.githubusercontent.com/8190114/210779498-76daedb2-355e-494c-9ac3-fea5423f83f9.png">


<img width="753" alt="Screenshot 2023-01-05 at 5 53 19 PM" src="https://user-images.githubusercontent.com/8190114/210779450-32fbce29-ff5b-45d7-a70a-b0455fda413f.png">
