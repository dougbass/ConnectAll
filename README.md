# ConnectAll

ConnectAll is a **commercial** and licensed application integration platform based on MuleSoft, Tomcat, and MySql.

## Getting Started

ConnectALL is an enterprise application integration solution that connects multiple tools and applications, enabling a company’s development and management teams to collaborate efficiently and flawlessly across multiple development platforms. Easy-to-buy, easy-to-install, and easy-to-use, ConnectALL meets strict enterprise governance requirements. It leverages commercial Enterprise Service Bus (ESB) technology to achieve an enterprise-grade infrastructure with clustering, multi-tenancy architecture, multiple server support both in the cloud and on-premise, traceability, and audit trails.

More details on the ConnectAll product including a complete documentation set can be found here: https://www.connectall.com.

To start the container first install docker for your machine, download the contents of this git project, and download the ConnectAll product from the website. To get access to the ConnectAll installer please fill out the form here: https://www.connectall.com/contact/.

An alternative is simply search for connectall and run the image hosted by me (dougbass).

Once everything is ready, run the docker-compose command. For an example see the file "up".

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

You'll also need to request the ConnectAll product installer and evaluation licenses by filling out this form: https://www.connectall.com/contact/

### Usage

Once the container is started up (in about a minute) go to your browser here: http://localhost:8080/ConnectAll
#### Container Parameters

List the different parameters available to your container

```shell
mkdir ./mule
export CONNECTALL=./mule; export INSTALLER=ConnectAll_Unix_2_8_3_R67dc0c2b_64.sh ; export VERSION=2.8.3.11; docker-compose -d up
```

#### Environment Variables

* `CONNECTALL` - A local folder to store all the data. If this is not provided a volume called "mule" will be created for storage.
* `INSTALLER` - REQUIRED The connectAll installer provided to you by sales@connectall.com.
* `VERSION` - REQUIRED The tag that will be applied to the created images. The version of the installer is a good idea, eg, 2.8.3.11.
* `WEB_PORT` - the port that Tomcat and the ConnectAll user interface is on. The default is 8080.
* `PUSH_PORT` - The port mule will listen on for messages pushed from an application. This is usually not needed as ConnectAll will poll for any changes in your applications. The default is 7070
* `GENERIC_PORT` - The port mule will listen on to enable a generic (ie custom) application for synchronization. The default is 8090.
* `ATTACHMENT_DOWNLOAD_PORT` - ConnectAll can synchronize entire attachments or just the url. This is the port that mule will honor attachment download requests. The default is 60000.
* `RENDERER_PORT` - You can develop custom renderers to view remote application data. This is the port that mule listens on to honor this request. The default is 8098.

#### Volumes

* `mule` - Where the data for the application is stored unless you provide a local folder using the CONNECTALL environment variable
* See the description of the MySql:5.6 image for additional volumes.

#### Useful File Locations

* `up` - A shell script to start up the container
* `/etc/init.d/tomcat` - the startup script for tomcat
* `/etc/init.d/mule` - the startup script for mule

## Built With

* MySql:5.6 for the database image
* Centos:latest for the mule and tomcat images

## Limitations
* The dashboard feature has been fixed in the ConnectAll 2.8.4.2 build. Be sure to install this or a later version.
* Additional nodes (i.e. a cluster) cannot be spawned at this time but multiple containers (i.e. a vertical partition) can be started using different ports and file storage.

## Find Us

* [GitHub](https://github.com/dougbass/ConnectAll)
* [ConnectAll](https://www.connectall.com)
* [Support](https://jira.connectall.com/servicedesk/customer/portal/11)

## Authors

* **Doug Bass** - *Initial work* - [LinkedIn](https://www.linkedin.com/in/dougbass/)

## License

This project is licensed under the ConnectAll EULA - contact sales@connectall.com for details.
